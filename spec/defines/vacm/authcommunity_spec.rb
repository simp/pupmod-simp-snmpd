require 'spec_helper'

describe 'snmpd::vacm::authcommunity' do

  let(:title) {'test_authcommunity'}
  let(:params) {{
    :types     => 'test_types',
    :community => 'test_community'
  }}
  base_facts = {
    :interfaces => 'eth0'
  }
  let(:facts){base_facts}

  it { should compile.with_all_deps }
  it { should contain_class('snmpd') }
  it { should create_concat_fragment('snmpd+test_authcommunity.authc') }
end
