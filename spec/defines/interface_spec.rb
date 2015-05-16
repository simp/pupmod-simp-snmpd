require 'spec_helper'

describe 'snmpd::interface' do

  let(:title) {'test_interface'}
  let(:params) {{
    :type  => 'ethernet',
    :speed => '1000'
  }}
  base_facts = {
    :interfaces => 'eth0'
  }
  let(:facts){base_facts}

  it { should compile.with_all_deps }
  it { should contain_class('snmpd') }
  it { should create_concat_fragment('snmpd+test_interface.iface') }
end
