require 'spec_helper'

describe 'snmpd::vacm::authgroup' do

  let(:title) {'test_authgroup'}
  let(:params) {{
    :types => 'test_types',
    :group => 'test_group'
  }}
  base_facts = {
    :interfaces => 'eth0'
  }
  let(:facts){base_facts}

  it { should compile.with_all_deps }
  it { should contain_class('snmpd') }
  it { should create_concat_fragment('snmpd+test_authgroup.authg') }
end
