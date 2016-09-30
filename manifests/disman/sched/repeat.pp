# == Define: snmpd::disman::sched::repeat
#
# Schedule a SET assignment to be run every $frequency seconds.
#
# See "DisMan Schedule MIB" in the snmpd.conf(5) man page for additional
# information.
#
# == Parameters
#
# [*name*]
#   This becomes part of the temporary file name. Do not put a '/' in the $name!
#
# [*frequency*]
# [*$oid*]
# [*$value*]
#
# == Authors
#
# * Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::disman::sched::repeat (
  $frequency,
  $oid,
  $value
) {
  include 'snmpd'

  simpcat_fragment { "snmpd+disman.${name}.sched":
    content => "repeat ${frequency} ${oid} = ${value}\n"
  }
}
