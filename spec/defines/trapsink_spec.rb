require 'spec_helper'

describe 'snmpd::trapsink' do

  let(:title) {'test_trapsink'}
  let(:params) {{
    :community => 'test_community',
    :port      => '12345'
  }}
  base_facts = {
    :interfaces => 'eth0'
  }
  let(:facts){base_facts}

  it { should compile.with_all_deps }
  it { should contain_class('snmpd') }
  it { should create_concat_fragment('snmpd+test_trapsink.trap.sink') }
end
