# == Define: snmpd::procmon
#
# Configure process monitoring.
#
# See snmpd.conf(5) 'Process Monitoring' for more information on this class.
# In all defines $name is mapped to NAME from the man page.
#
# == Parameters
#
# [*max*]
# [*min*]
#
# == Authors
#
# * Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::procmon::proc (
  $max = '',
  $min = ''
) {
  include 'snmpd'

  simpcat_fragment { "snmpd+${name}.proc":
    content => template('snmpd/proc.erb')
  }
}
