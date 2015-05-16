require 'spec_helper'

describe 'snmpd::useracl' do

  let(:title) {'test_useracl'}
  let(:params) {{
    :user => 'test_user',
  }}
  base_facts = {
    :interfaces => 'eth0'
  }
  let(:facts){base_facts}

  it { should compile.with_all_deps }
  it { should contain_class('snmpd') }
  it { should create_concat_fragment('snmpd+test_useracl.auth') }
end
