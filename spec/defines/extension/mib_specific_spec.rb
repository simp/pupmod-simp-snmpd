require 'spec_helper'

describe 'snmpd::extension::mib_specific' do

  let(:title) {'test_mib_specific'}
  let(:params) {{
    :ext_type => 'pass',
    :miboid   => '1234567890',
    :prog     => 'test_program'
  }}
  base_facts = {
    :interfaces => 'eth0'
  }
  let(:facts){base_facts}

  it { should compile.with_all_deps }
  it { should contain_class('snmpd') }
  it { should create_concat_fragment('snmpd+ext.test_mib_specific.pass') }
end
