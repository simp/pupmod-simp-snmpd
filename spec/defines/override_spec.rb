require 'spec_helper'

describe 'snmpd::override' do

  let(:title) {'test_override'}
  let(:params) {{
    :oid     => '1234567890',
    :or_type => 'foo',
    :value   => 'bar'
  }}
  base_facts = {
    :interfaces => 'eth0'
  }
  let(:facts){base_facts}

  it { should compile.with_all_deps }
  it { should contain_class('snmpd') }
  it { should create_concat_fragment('snmpd+test_override_override.other') }
end
