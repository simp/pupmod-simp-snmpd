# == Class: snmpd::load
#
# See snmpd.conf(5) 'System Load Monitoring' for additional information.
#
# == Parameters
#
# [*max1*]
# [*max5*]
# [*max15*]
#
# == Authors
#
# * Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
class snmpd::load (
  $max1,
  $max5 = '',
  $max15 = ''
) {
  simpcat_fragment { 'snmpd+mon.load':
    content => "load ${max1} ${max5} ${max15}\n"
  }
}
