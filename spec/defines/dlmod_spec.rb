require 'spec_helper'

describe 'snmpd::dlmod' do

  let(:title) {'test_dlmod'}
  let(:params) {{
    :path => '/test/path/foo/bar'
  }}
  base_facts = {
    :interfaces => 'eth0'
  }
  let(:facts){base_facts}

  it { should compile.with_all_deps }
  it { should create_concat_fragment('snmpd+test_dlmod.module') }
  it { should contain_class('snmpd') }
end
