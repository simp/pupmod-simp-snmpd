# == Define: snmpd::smux::smuxsocket
#
# See snmpd.conf(5) SMUX Sub-Agents for more information.
#
# == Parameters
#
# [*ipv4_address*]
# [*allowed_nets*]
#
# == Authors
#
# * Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::smux::smuxsocket (
  $ipv4_address,
  $allowed_nets
) {
  include 'snmpd'

  validate_net_list($allowed_nets)

  concat_fragment { "snmpd+socket.${name}.smux":
    content => "smuxsocket ${ipv4_address}\n"
  }

  if defined('iptables') and defined(Class['iptables']) {
    iptables::add_tcp_stateful_listen { "smux_${name}":
      client_nets => $allowed_nets,
      dports      => '199'
    }
  }
}
