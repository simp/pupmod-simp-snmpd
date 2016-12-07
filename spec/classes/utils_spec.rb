require 'spec_helper'

describe 'snmpd::utils' do
  on_supported_os.each do |os, facts|
    let(:facts) do
      facts
    end

    context "on #{os}" do
      describe 'with default parameters' do
        it { is_expected.to create_class('snmpd::utils') }
        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_class('rsync') }
        it { is_expected.to contain_rsync('snmp_mibs').with({
          :source => "snmp_#{environment}/mibs",
          :server => "test.example.domain",
          :timeout => "2"
          })
        }
        it { is_expected.to contain_package('net-snmp-utils') }
        it { is_expected.to contain_exec('set_snmp_perms') }
        it { is_expected.to create_file('/etc/snmp/snmp.local.conf').with({
            :notify  => 'Exec[set_snmp_perms]',
            :require => 'Package[net-snmp-utils]'
          })
        }
        it { is_expected.to create_file('/usr/local/share/snmp').with({
            :ensure  => 'directory',
            :require => 'Package[net-snmp-utils]'
          })
        }
      end
    end
  end
end
