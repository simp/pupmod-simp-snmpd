# == Define: snmpd::diskusage::disk
#
# Set up SNMP Disk Usage Monitoring.
#
# See snmpd.conf(5) 'Disk Usage Monitoring' for additional information.
#
# == Parameters
#
# [*name*]
#   Translates to part of the temp file name. Do not add '/' to $name.
#
# [*disk_path*]
# [*minspace*]
#   This overrides $minpercent.
#
# [*minpercent*]
#   Do not add the trailing '%' to this number.
#
# == Authors
#
# * Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::diskusage::disk (
  $disk_path,
  $minspace = '',
  $minpercent = ''
) {
  include 'snmpd'

  simpcat_fragment { "snmpd+${name}.disks":
    content => template('snmpd/disk.erb')
  }
}
