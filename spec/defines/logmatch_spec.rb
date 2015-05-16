require 'spec_helper'

describe 'snmpd::logmatch' do

  let(:title) {'test_logmatch'}
  let(:params) {{
    :file_path  => '/test/path/foo/bar',
    :cycle_time => '60',
    :regex      => '^test*'
  }}
  base_facts = {
    :interfaces => 'eth0'
  }
  let(:facts){base_facts}

  it { should compile.with_all_deps }
  it { should contain_class('snmpd') }
  it { should create_concat_fragment('snmpd+test_logmatch.logmatch') }
end
