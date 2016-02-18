require 'spec_helper'

describe 'snmpd::utils::conf' do

  on_supported_os.each do |os, base_facts|
    let(:facts){base_facts.merge( :interfaces => 'eth0' )}

    context "on #{os}" do
      describe 'with default parameters' do

        it { is_expected.to create_class('snmpd::utils::conf') }
        it { is_expected.to compile.with_all_deps }
        it { is_expected.to create_file('/etc/snmp/snmp.conf').with({
            :content => /defSecurityLevel\sauthPriv/,
            :notify  => 'Exec[set_snmp_perms]'
          })
        }
      end
    end
  end
end
