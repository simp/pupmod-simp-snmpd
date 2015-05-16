require 'spec_helper'

describe 'snmpd::procmon::proc' do

  let(:title) {'test_proc'}
  let(:params) {{
    :max => '90',
    :min => '50'
  }}
  base_facts = {
    :interfaces => 'eth0'
  }
  let(:facts){base_facts}

  it { should compile.with_all_deps }
  it { should contain_class('snmpd') }
  it { should create_concat_fragment('snmpd+test_proc.proc') }
end
