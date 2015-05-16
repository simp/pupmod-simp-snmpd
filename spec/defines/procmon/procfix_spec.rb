require 'spec_helper'

describe 'snmpd::procmon::procfix' do

  let(:title) {'test_procfix'}
  let(:params) {{
    :prog => 'test_program',
    :args => 'foo,bar,baz'
  }}
  base_facts = {
    :interfaces => 'eth0'
  }
  let(:facts){base_facts}

  it { should compile.with_all_deps }
  it { should contain_class('snmpd') }
  it { should create_concat_fragment('snmpd+test_procfix.procfix') }
end
