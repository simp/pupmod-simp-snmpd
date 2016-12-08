require 'spec_helper'

describe 'snmpd' do
  on_supported_os.each do |os, base_facts|
    let(:facts){base_facts.merge({ :interfaces => 'eth0' })}

    context "on #{os}" do
      describe 'with default parameters' do
        it { is_expected.to compile.with_all_deps }
        it { is_expected.to create_class('snmpd') }
        it { is_expected.to contain_class('snmpd::utils') }
        it { is_expected.to contain_simpcat_build('snmpd') }
        it { is_expected.to contain_simpcat_build('snmpd_agentaddress') }
        it { is_expected.to create_file('/etc/snmp/snmpd.conf').with({
            :notify  => ['Service[snmpd]', 'Exec[set_snmp_perms]'],
            :audit   => 'content',
            :require => ['Package[net-snmp]', 'Package[net-snmp-libs]']
        })}
        it { is_expected.to create_file('/etc/snmp/snmpd.local.conf').with({
            :notify  => ['Service[snmpd]', 'Exec[set_snmp_perms]'],
            :require => ['Package[net-snmp]', 'Package[net-snmp-libs]']
        })}
        it { is_expected.to contain_package('net-snmp').with_ensure('latest') }
        it { is_expected.to contain_package('net-snmp-libs').with_ensure('latest') }
        it { is_expected.to contain_class('rsync') }
        it { is_expected.to contain_rsync('snmp_dlmod').with({
          :source => "snmp_#{environment}/dlmod",
          :server => "test.example.domain",
          :timeout => "2"
          })
        }
        it { is_expected.to contain_service('snmpd').with({
            :ensure    => 'running',
            :enable    => true,
            :subscribe => 'File[/etc/snmp/snmpd.conf]',
            :require   => ['Package[net-snmp]', 'Package[net-snmp-libs]']
        })}
        #TODO verify content from erb
        it { is_expected.to contain_simpcat_fragment('snmpd+main.conf') }
        it { is_expected.to contain_group('snmp') }
        it { is_expected.to contain_user('snmp') }
      end

      describe 'with tcpwrappers enabled' do
        let(:params) {{ :tcpwrappers => true }}
        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_class('tcpwrappers') }
        it { is_expected.to contain_tcpwrappers__allow('snmpd').with( :pattern => 'ALL') }
      end

      # Requires code refactor.  See comments in init.pp
      skip 'with unset agentgid and agentuid' do
        let(:params) {{ :agentgid => '', :agentuid => '' }}
        it { is_expected.to compile.with_all_deps }
        it { is_expected.to_not contain_group('snmp') }
        it { is_expected.to_not contain_user('snmp') }
      end
    end
  end
end
