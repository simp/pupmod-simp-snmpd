require 'spec_helper'

describe 'snmpd::utils' do
  on_supported_os.each do |os, facts|
    let(:facts) do
      facts
    end

    context "on #{os}" do
      describe 'with default parameters' do
        it { should create_class('snmpd::utils') }
        it { should compile.with_all_deps }
        it { should contain_class('rsync') }
        it { should contain_package('net-snmp-utils') }
        it { should contain_exec('set_snmp_perms') }
        it { should create_file('/etc/snmp/snmp.local.conf').with({
            :notify  => 'Exec[set_snmp_perms]',
            :require => 'Package[net-snmp-utils]'
          })
        }
        it { should create_file('/usr/local/share/snmp').with({
            :ensure  => 'directory',
            :require => 'Package[net-snmp-utils]'
          })
        }
      end
    end
  end
end
