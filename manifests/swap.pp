# == Class: snmpd::swap
#
# Monitor the amount of swap space available on the sysetm.
#
# See the 'System Load Monitoring' section of snmpd.conf(5) for details.
#
# == Parameters
#
# [*min*]
#
# == Authors
#
# * Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
class snmpd::swap (
  $min
) {
  concat_fragment { 'snmpd+swap.load':
    content => "swap $min\n"
  }

  validate_integer($min)
}
