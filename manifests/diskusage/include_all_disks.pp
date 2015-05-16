# == Class: snmpd::diskusage::include_all_disks
#
# Set up disk usage monitoring, by percent, for all disks.
#
# See snmpd.conf(5) 'Disk Usage Monitoring' for additional information.
#
# == Parameters
#
# [*minpercent*]
#   Do not add the trailing '%' to this variable.
#
# == Authors
#
# * Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
class snmpd::diskusage::include_all_disks (
  $minpercent
) {
  concat_fragment { 'snmpd+all.disks':
    content => "includeAllDisks ${minpercent}%\n"
  }

  validate_integer($minpercent)
}
