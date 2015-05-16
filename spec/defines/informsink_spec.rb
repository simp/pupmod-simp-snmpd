require 'spec_helper'

describe 'snmpd::informsink' do

  let(:title) {'test_informsink'}
  let(:params) {{
    :community => 'test_community',
    :port      => '12345'
  }}
  base_facts = {
    :interfaces => 'eth0'
  }
  let(:facts){base_facts}

  it { should compile.with_all_deps }
  it { should create_concat_fragment('snmpd+test_informsink.inform.sink') }
  it { should contain_class('snmpd') }
end
