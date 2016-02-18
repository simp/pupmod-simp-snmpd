# == Define: snmpd::disman::sched::cron
#
# Schedule a periodic SET assignment.
#
# See "DisMan Schedule MIB" in the snmpd.conf(5) man page for additional
# information.
#
# == Parameters
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
# * Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::disman::sched::cron (
  $oid,
  $value,
  $minute = '*',
  $hour = '*',
  $day = '*',
  $month = '*',
  $weekday = '*'
) {
  include 'snmpd'

  concat_fragment { "snmpd+disman.${name}.cron":
    content => "cron ${minute} ${hour} ${day} ${month} ${weekday} ${oid} = ${value}\n"
  }
}
