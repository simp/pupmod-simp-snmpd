require 'spec_helper'

describe 'snmpd' do


  base_facts = {
    :interfaces => 'eth0'
  }
  let(:facts){base_facts}

  it { should create_class('snmpd') }
  it { should compile.with_all_deps }
  it { should contain_concat_build('snmpd') }
  it { should contain_concat_build('snmpd_agentaddress') }
  it { should create_file('/etc/snmp/snmpd.conf').with({
      :notify  => ['Service[snmpd]', 'Exec[set_snmp_perms]'],
      :audit   => 'content',
      :require => ['Package[net-snmp]', 'Package[net-snmp-libs]']
    })
  }
  it { should contain_package('net-snmp').with_ensure('latest') }
  it { should contain_package('net-snmp-libs').with_ensure('latest') }
  it { should create_file('/etc/snmp/snmpd.local.conf').with({
      :notify  => ['Service[snmpd]', 'Exec[set_snmp_perms]'],
      :require => ['Package[net-snmp]', 'Package[net-snmp-libs]']
    })
  }
  it { should contain_rsync('snmp_dlmod') }
  it { should contain_service('snmpd').with({
      :ensure    => 'running',
      :enable    => true,
      :subscribe => 'File[/etc/snmp/snmpd.conf]',
      :require   => ['Package[net-snmp]', 'Package[net-snmp-libs]']
    })
  }
end
