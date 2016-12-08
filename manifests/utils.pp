# == Class: snmpd::utils
#
# Set up the framework and clients for the SNMP utilities.
# This can be used without the server, but it isn't very common.
#
# See snmpcmd(1) for additional details.
#
# == Parameters
#
# == Authors
#
# * Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
class snmpd::utils (
  $rsync_source  = "snmp_${::environment}/mibs",
  $rsync_server  = simplib::lookup('simp_options::rsync::server',  { 'default_value' => '127.0.0.1', 'value_type' => String}),
  $rsync_timeout = simplib::lookup('simp_options::rsync::timeout', { 'default_value' => '2', 'value_type' => String }),
){
  validate_integer($rsync_timeout)

  include '::rsync'

  package { 'net-snmp-utils': ensure => 'latest' }

  exec { 'set_snmp_perms':
    command => '/usr/bin/setfacl -R -m g:snmp:r /etc/snmp /usr/local/share/snmp',
    onlyif  => '/bin/grep -q "^snmp" /etc/group',
    require => Package['net-snmp-utils']
  }

  file { '/etc/snmp/snmp.local.conf':
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    notify  => Exec['set_snmp_perms'],
    require => Package['net-snmp-utils']
  }

  # This directory will be where items pulled from rsync will go.
  file { '/usr/local/share/snmp':
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['net-snmp-utils']
  }

  # This pulls down all custom mibs from the rsync server.
  rsync { 'snmp_mibs':
    source       => $rsync_source,
    target       => '/usr/local/share/snmp',
    server       => $rsync_server,
    timeout      => $rsync_timeout,
    delete       => true,
    preserve_acl => false,
    notify       => Exec['set_snmp_perms']
  }
}
