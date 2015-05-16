require 'spec_helper'

describe 'snmpd::vacm::group' do

  let(:title) {'test_group'}
  let(:params) {{
    :group   => 'test_group',
    :secname => 'test_secname'
  }}
  base_facts = {
    :interfaces => 'eth0'
  }
  let(:facts){base_facts}

  it { should compile.with_all_deps }
  it { should contain_class('snmpd') }
  it { should create_concat_fragment('snmpd+test_group.group') }
end
