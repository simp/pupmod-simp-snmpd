# == Class: snmpd
#
# Configure the SNMP Daemon.
#
# This class, and the associated defines, should provide relatively
# comprehensive coverage of the snmpd features.
#
# See snmpd(8) and snmpd.conf(5) for additional details.
#
# == Parameters
#
# [*rsync_server*]
# [*rsync_timeout*]
#
# == Authors
#
# * Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
class snmpd (
  $rsync_server = hiera('rsync::server'),
  $rsync_timeout = hiera('rsync::timeout','2'),
  $agentgid = '333',
  $agentuid = '333',
  $leave_pidfile = 'no',
  $max_get_bulk_repeats = '1024',
  $max_get_bulk_responses = '100',
  $engine_id = '',
  $engine_id_type = '',
  $engine_id_nic = '',
  $dont_log_tcp_wrappers_connects = false
){
  include 'rsync'
  include 'tcpwrappers'
  include 'snmpd::utils'
  include 'functions'


  $l_fragdir = fragmentdir('snmpd')
  $l_outdir = concat_output('snmpd')

  concat_build { 'snmpd':
    target => '/etc/snmp/snmpd.conf',
    order  => [
        '*.all',
        'main.conf',
        '*.auth',
        '*.comm',
        '*.com2sec',
        '*.group',
        '*.view',
        '*.tview',
        '*.access',
        '*.authc',
        '*.authu',
        '*.authg',
        '*.autha',
        '*.seta',
        '*.system',
        '*.iface',
        '*.host_resources',
        '*.proc',
        '*.procfix',
        '*.disks',
        '*.load',
        '*.logmon',
        '*.logmatch',
        '*.comstr',
        '*.sink',
        '*.trapsess',
        'all.authtrapenable',
        'all.v1trapaddress',
        'disman.*',
        'ext.*',
        '*.module',
        '*.proxy',
        '*.smux',
        '*.agentX',
        '*.other',
        '*.inject',
        '*.user' ],
    notify => File['/etc/snmp/snmpd.conf']
  }

  concat_build { 'snmpd_agentaddress':
    clean_whitespace => 'all',
    target           => "$l_fragdir/agentaddress.all",
    parent_build     => 'snmpd',
    file_delimiter   => ',',
    quiet            => true
  }

  file { '/etc/snmp/snmpd.conf':
    owner    => 'root',
    group    => 'root',
    mode     => '0640',
    notify   => [ Service['snmpd'], Exec['set_snmp_perms'] ],
    audit    => content,
    require  => [
      Package['net-snmp'],
      Package['net-snmp-libs']
    ]
  }

  file { '/etc/snmp/snmpd.local.conf':
    owner    => 'root',
    group    => 'root',
    mode     => '0640',
    notify   => [ Service['snmpd'], Exec['set_snmp_perms'] ],
    require  => [
      Package['net-snmp'],
      Package['net-snmp-libs']
    ]
  }

  package { [
      'net-snmp',
      'net-snmp-libs',
    ]:
      ensure => 'latest'
  }

  # This pulls any global dynamically loadable modules for later inclusion in
  # the configuration file.
  #
  # If this does not succeed, then the entire build chain will fail.
  rsync { 'snmp_dlmod':
    source       => 'snmp/dlmod',
    target       => '/usr/local/share/snmp',
    server       => $rsync_server,
    timeout      => $rsync_timeout,
    delete       => true,
    preserve_acl => false,
    notify       => [
      Service['snmpd'],
      Exec['set_snmp_perms']
    ]
  }

  service { 'snmpd':
    ensure    => 'running',
    enable    => true,
    start     =>
      'process=`/bin/ps -C snmpd > /dev/null; /bin/echo $?`; if [ $process -eq 0 ]; then /sbin/service snmpd reload; else /sbin/service snmpd start; fi',
    restart   =>
      '/sbin/service snmpd stop; /bin/sed -i /usmUser/d /var/net-snmp/snmpd.conf; /sbin/service snmpd start',
    subscribe => File['/etc/snmp/snmpd.conf'],
    require   => [
      Package['net-snmp'],
      Package['net-snmp-libs']
    ]
  }

  tcpwrappers::allow { 'snmpd':
    pattern => 'ALL'
  }

  concat_fragment { 'snmpd+main.conf':
    content => template('snmpd/main.conf.erb')
  }

  if !empty($agentgid) {
    group { 'snmp':
      ensure    => 'present',
      gid       => $agentgid,
      allowdupe => false,
      notify    => Service['snmpd']
    }
  }

  if !empty($agentuid) {
    user { 'snmp':
      ensure     => 'present',
      uid        => $agentuid,
      comment    => 'SNMP User',
      gid        => 'snmp',
      home       => '/var/run/snmpd',
      managehome => false,
      shell      => '/sbin/nologin',
      notify     => Service['snmpd']
    }
  }

  validate_bool($dont_log_tcp_wrappers_connects)
  validate_integer($agentgid)
  validate_integer($agentuid)
}
