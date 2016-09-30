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
# [*allow_from*]
#   The address range(s) to allow connections from.
#   Follows the syntax accepted by the iptables module.
#
# == Authors
#
# * Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::agentaddress (
  $addr_type = 'agentaddress',
  $transport_specifier = 'udp',
  $transport_address = 'any',
  $transport_port = '161',
  $allow_from = ['127.0.0.1']
) {
  include 'snmpd'

  simpcat_fragment { "snmpd_agentaddress+${name}.agentaddress":
    content => template('snmpd/agentaddress.erb'),
  }

  if defined('iptables') and defined(Class['iptables']) {
    if $transport_specifier == 'udp' {
      iptables::add_udp_listen { "snmpd_${name}_udp_listen":
        client_nets => $allow_from,
        dports      => $transport_port
      }
    }
    if $transport_specifier == 'tcp' {
      iptables::add_tcp_stateful_listen { "snmpd_${name}_tcp_listen":
        client_nets => $allow_from,
        dports      => $transport_port
      }
    }
  }
  if defined('ip6tables') and defined(Class['ip6tables']) {
    if $transport_specifier == 'udp6' {
      ip6tables::add_udp_listen { "snmpd_${name}_udp6_listen":
        client_nets => $allow_from,
        dports      => $transport_port
      }
    }
    if $transport_specifier == 'tcp6' {
      ip6tables::add_tcp_stateful_listen { "snmpd_${name}_tcp6_listen":
        client_nets => $allow_from,
        dports      => $transport_port
      }
    }
  }

  validate_net_list($allow_from)
}
