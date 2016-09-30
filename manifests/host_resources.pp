# == Class: snmpd::host_resources
#
# See snmpd.conf(5) 'Host Resources Group' for additional information.
#
# == Parameters
#
# [*ignore_disk*]
# [*skip_NFS_in_host_resources*]
# [*storage_use_NFS*]
#
# == Authors
#
# * Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
class snmpd::host_resources (
  $ignore_disk = '',
  $skip_NFS_in_host_resources = '',
  $storage_use_NFS = ''
) {
  simpcat_fragment { 'snmpd+info.host_resources':
    content => template('snmpd/host_resources.erb')
  }
}
