require 'spec_helper'

describe 'snmpd::utils::conf' do

  base_facts = {
    :interfaces => 'eth0'
  }
  let(:facts){base_facts}

  it { should create_class('snmpd::utils::conf') }
  it { should compile.with_all_deps }
  it { should create_file('/etc/snmp/snmp.conf').with({
      :content => /defSecurityLevel\sauthPriv/,
      :notify  => 'Exec[set_snmp_perms]'
    })
  }
end
