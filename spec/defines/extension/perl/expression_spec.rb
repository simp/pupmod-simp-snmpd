require 'spec_helper'

describe 'snmpd::extension::perl::expression' do

  let(:title) {'test_expression'}
  let(:params) {{
    :expression => 'exec'
  }}
  base_facts = {
    :interfaces => 'eth0'
  }
  let(:facts){base_facts}

  it { should compile.with_all_deps }
  it { should contain_class('snmpd') }
  it { should create_concat_fragment('snmpd+ext.perl.exp.test_expression') }
end
