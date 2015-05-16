require 'spec_helper'

describe 'snmpd::trap2sink' do

  let(:title) {'test_trap2sink'}
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
  it { should create_concat_fragment('snmpd+test_trap2sink.trap2.sink') }
end
