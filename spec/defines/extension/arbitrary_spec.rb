require 'spec_helper'

describe 'snmpd::extension::arbitrary' do

  let(:title) {'test_arbitrary'}
  let(:params) {{
    :ext_type => 'exec',
    :prog     => 'test_prog',
    :args     => 'foo,bar,baz'
  }}
  base_facts = {
    :interfaces => 'eth0'
  }
  let(:facts){base_facts}

  it { should compile.with_all_deps }
  it { should contain_class('snmpd') }
  it { should create_concat_fragment('snmpd+ext.test_arbitrary.exec') }
end
