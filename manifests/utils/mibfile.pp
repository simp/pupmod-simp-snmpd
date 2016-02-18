# == Define: snmpd::utils::mibfile
#
# Add mibfiles to /etc/snmp/snmp.local.conf
#
# See snmp.conf(5) for details on  loading mibfiles.
#
# == Parameters
#
# [*name*]
#   The mib file you want to load.
#
# == Authors
#
# * Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::utils::mibfile {
  include 'snmpd'

  simp_file_line { $name:
    path   => '/etc/snmp/snmp.local.conf',
    line   => "mibfile ${name}",
    notify => File['/etc/snmp/snmp.local.conf']
  }
}
