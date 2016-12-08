# == Define: snmpd::agentaddress
#
# Add an agent address and the associated iptables accesses.
#
# You need to have previously included iptables somewhere for that portion to
# be active.
#
# See snmpd.conf(5) - 'AGENT BEHAVIOUR' for details.
#
# If you set addr_type to 'agentX', then this will enable an agentXSocket at
# this transport address.
#
# == Parameters
#
# [*name*]
#   This becomes part of the temp file path. Do not use '/' in $name.
#
# [*addr_type*]
# [*transport_specifier*]
# [*transport_address*]
# [*transport_port*]
# [*trusted_nets*]
#   The address range(s) to allow connections from.
#   Follows the syntax accepted by the iptables module.
#
# == Authors
#
# * Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::agentaddress (
  $addr_type           = 'agentaddress',
  $transport_specifier = 'udp',
  $transport_address   = 'any',
  $transport_port      = '161',
  $firewall            = simplib::lookup('simp_options::firewall', { 'default_value' => false, 'value_type' => Boolean }),
  $trusted_nets        = simplib::lookup('simp_options::trusted_nets', { 'default_value' => ['127.0.0.1', '::1'], 'value_type' => Array[String] }),
) {
  validate_net_list($trusted_nets)

  include '::snmpd'

  simpcat_fragment { "snmpd_agentaddress+${name}.agentaddress":
    content => template('snmpd/agentaddress.erb'),
  }

  if $firewall {
    include '::iptables'
    if $transport_specifier == 'udp' {
      iptables::add_udp_listen { "snmpd_${name}_udp_listen":
        trusted_nets => $trusted_nets,
        dports       => $transport_port,
        apply_to     => 'ipv4'
      }
    }
    if $transport_specifier == 'tcp' {
      iptables::add_tcp_stateful_listen { "snmpd_${name}_tcp_listen":
        trusted_nets => $trusted_nets,
        dports       => $transport_port,
        apply_to     => 'ipv4'
      }
    }
    if $transport_specifier == 'udp6' {
      iptables::add_udp_listen { "snmpd_${name}_udp6_listen":
        trusted_nets => $trusted_nets,
        dports       => $transport_port,
        apply_to     => 'ipv6'
      }
    }
    if $transport_specifier == 'tcp6' {
      iptables::add_tcp_stateful_listen { "snmpd_${name}_tcp6_listen":
        trusted_nets => $trusted_nets,
        dports       => $transport_port,
        apply_to     => 'ipv6'
      }
    }
  }
}
