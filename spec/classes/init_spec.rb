require 'spec_helper'

describe 'snmpd' do
  on_supported_os.each do |os, base_facts|
    let(:facts){base_facts.merge({ :interfaces => 'eth0' })}

    context "on #{os}" do
      describe 'with default parameters' do
        it { is_expected.to create_class('snmpd') }
        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_simpcat_build('snmpd') }
        it { is_expected.to contain_simpcat_build('snmpd_agentaddress') }
        it { is_expected.to create_file('/etc/snmp/snmpd.conf').with({
            :notify  => ['Service[snmpd]', 'Exec[set_snmp_perms]'],
            :audit   => 'content',
            :require => ['Package[net-snmp]', 'Package[net-snmp-libs]']
        })}
        it { is_expected.to contain_package('net-snmp').with_ensure('latest') }
        it { is_expected.to contain_package('net-snmp-libs').with_ensure('latest') }
        it { is_expected.to create_file('/etc/snmp/snmpd.local.conf').with({
            :notify  => ['Service[snmpd]', 'Exec[set_snmp_perms]'],
            :require => ['Package[net-snmp]', 'Package[net-snmp-libs]']
        })}
        it { is_expected.to contain_rsync('snmp_dlmod') }
        it { is_expected.to contain_service('snmpd').with({
            :ensure    => 'running',
            :enable    => true,
            :subscribe => 'File[/etc/snmp/snmpd.conf]',
            :require   => ['Package[net-snmp]', 'Package[net-snmp-libs]']
        })}
      end
    end
  end
end
