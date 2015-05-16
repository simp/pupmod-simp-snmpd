require 'spec_helper'

describe 'snmpd::vacm::setaccess' do

  let(:title) {'test_setaccess'}
  let(:params) {{
    :group   => 'test_group',
    :context => 'test_context',
    :model   => 'test_model',
    :level   => 'test_level',
    :prefix  => 'test_prefix',
    :view    => 'test_view',
    :types   => 'test_types'
  }}
  base_facts = {
    :interfaces => 'eth0'
  }
  let(:facts){base_facts}

  it { should compile.with_all_deps }
  it { should contain_class('snmpd') }
  it { should create_concat_fragment('snmpd+test_setaccess.autha') }
end
