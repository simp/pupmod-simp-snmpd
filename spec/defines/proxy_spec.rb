require 'spec_helper'

describe 'snmpd::proxy' do

  let(:title) {'test_proxy'}
  let(:params) {{
    :host => 'test.example.domain',
    :oid  => '1234567890'
  }}
  base_facts = {
    :interfaces => 'eth0'
  }
  let(:facts){base_facts}

  it { should compile.with_all_deps }
  it { should contain_class('snmpd') }
  it { should create_concat_fragment('snmpd+test_proxy.proxy') }
end
