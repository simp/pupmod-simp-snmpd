require 'spec_helper'

describe 'snmpd::communityacl' do

  let(:title) {'test_community'}
  let(:params) {{
    :community => 'foo_bar'
  }}

  base_facts = {
    :interfaces => 'eth0'
  }
  let(:facts){base_facts}

  it { should compile.with_all_deps }
  it { should contain_class('snmpd') }

  context 'base' do
    it { should create_concat_fragment('snmpd+test_community.comm') }
  end
end
