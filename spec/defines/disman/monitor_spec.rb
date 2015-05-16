require 'spec_helper'

describe 'snmpd::disman::monitor' do

  let(:title) {'test_monitor'}
  let(:params) {{
    :expression => 'test_expression'
  }}
  base_facts = {
    :interfaces => 'eth0'
  }
  let(:facts){base_facts}

  it { should compile.with_all_deps }
  it { should contain_class('snmpd') }
  it { should create_concat_fragment('snmpd+disman.test_monitor.monitor') }
end
