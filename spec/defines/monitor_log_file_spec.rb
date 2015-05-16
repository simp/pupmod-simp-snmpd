require 'spec_helper'

describe 'snmpd::monitor_log_file' do

  let(:title) {'test_monitor_log_file'}
  let(:params) {{
    :file_path => '/test/path/foo/bar',
    :max_size  => '1024'
  }}
  base_facts = {
    :interfaces => 'eth0'
  }
  let(:facts){base_facts}

  it { should compile.with_all_deps }
  it { should contain_class('snmpd') }
  it { should create_concat_fragment('snmpd+test_monitor_log_file.logmon') }
end
