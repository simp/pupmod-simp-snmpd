require 'spec_helper'

describe 'snmpd::createuser' do

  let(:title) {'test_user'}
  let(:params) {{
    :auth_phrase => 'test_auth_pass',
    :priv_phrase => 'test_priv_pass'
  }}
  base_facts = {
    :interfaces => 'eth0'
  }
  let(:facts){base_facts}

  it { should compile.with_all_deps }
  it { should create_concat_fragment('snmpd+test_user.user') }
  it { should contain_class('snmpd') }
end
