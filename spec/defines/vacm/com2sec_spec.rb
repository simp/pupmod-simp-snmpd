require 'spec_helper'

describe 'snmpd::vacm::com2sec' do

  let(:title) {'test_com2sec'}
  let(:params) {{
    :secname   => 'test_secname',
    :community => 'test_community'
  }}
  base_facts = {
    :interfaces => 'eth0'
  }
  let(:facts){base_facts}

  it { should compile.with_all_deps }
  it { should contain_class('snmpd') }
  it { should create_concat_fragment('snmpd+test_com2sec.com2sec') }
end
