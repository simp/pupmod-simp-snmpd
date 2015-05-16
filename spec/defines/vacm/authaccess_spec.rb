require 'spec_helper'

describe 'snmpd::vacm::authaccess' do

  let(:title) {'test_authaccess'}
  let(:params) {{
    :types => 'test_types',
    :group => 'test_group',
    :view  => 'test_view'
  }}
  base_facts = {
    :interfaces => 'eth0'
  }
  let(:facts){base_facts}

  it { should compile.with_all_deps }
  it { should contain_class('snmpd') }
  it { should create_concat_fragment('snmpd+test_authaccess.autha') }
end
