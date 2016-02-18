# == Define: snmpd::smux::smuxpeer
#
# See snmpd.conf(5) SMUX Sub-Agents for more information.
#
# == Parameters
#
# [*oid*]
# [*pass*]
#
# == Authors
#
# * Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::smux::smuxpeer (
  $oid,
  $pass
) {
  include 'snmpd'

  concat_fragment { "snmpd+peer.${name}.smux":
    content => "smuxpeer ${oid} ${pass}\n"
  }
}
