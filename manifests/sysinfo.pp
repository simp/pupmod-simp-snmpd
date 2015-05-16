# == Class: snmpd::sysinfo
#
# Set system information.
#
# == Parameters
#
# [*sys_location*]
# [*sys_contact*]
# [*sys_name*]
# [*sys_services*]
# [*sys_descr*]
# [*sys_object_id*]
#
# == Authors
#
# * Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
class snmpd::sysinfo (
  $sys_location = '',
  $sys_contact = '',
  $sys_name = '',
  $sys_services = '72',
  $sys_descr = '',
  $sys_object_id = ''
) {
  concat_fragment { 'snmpd+info.system':
    content => template('snmpd/sysinfo.erb')
  }

  validate_integer($sys_services)
}
