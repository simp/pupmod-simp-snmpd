# == Define: snmpd::disman::sched::at
#
# Schedule a one-time SET assignment.
#
# See "DisMan Schedule MIB" in the snmpd.conf(5) man page for additional
# information.
#
# == Parameters
#
# [*name*]
#   This becomes part of the temporary file name. Do not put a '/' in the $name!
#
# [*oid*]
# [*value*]
# [*minute*]
# [*hour*]
# [*day*]
# [*month*]
# [*weekday*]
#
# == Authors
#
# * Trevor Vaughan <mailto:tvuaghan@onyxpoint.com>
#
define snmpd::disman::sched::at (
  $oid,
  $value,
  $minute = '*',
  $hour = '*',
  $day = '*',
  $month = '*',
  $weekday = '*'
) {
  include 'snmpd'

  concat_fragment { "snmpd+disman.${name}.at":
    content => "at ${minute} ${hour} ${day} ${month} ${weekday} ${oid} = ${value}\n"
  }
}
