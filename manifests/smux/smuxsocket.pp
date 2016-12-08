# == Define: snmpd::smux::smuxsocket
#
# See snmpd.conf(5) SMUX Sub-Agents for more information.
#
# == Parameters
#
# [*ipv4_address*]
# [*trusted_nets*]
#
# == Authors
#
# * Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::smux::smuxsocket (
  $ipv4_address,
  $firewall      = simplib::lookup('simp_options::firewall', { 'default_value' => false, 'value_type' => Boolean }),
  $trusted_nets  = simplib::lookup('simp_options::trusted_nets', { 'default_value' => ['127.0.0.1', '::1'], 'value_type' => Array[String] })
) {
  validate_net_list($trusted_nets)

  include '::snmpd'

  simpcat_fragment { "snmpd+socket.${name}.smux":
    content => "smuxsocket ${ipv4_address}\n"
  }

  if $firewall {
    include '::iptables'
    iptables::add_tcp_stateful_listen { "smux_${name}":
      trusted_nets => $trusted_nets,
      dports       => '199'
    }
  }
}
