require 'spec_helper'

describe 'snmpd::monitor_log_file' do
  on_supported_os.each do |os, base_facts|
    let(:facts) do
      base_facts.merge({ :interfaces => 'eth0' })
    end

    context "on #{os}" do
      let(:title) {'test_monitor_log_file'}
      let(:params) {{
        :file_path => '/test/path/foo/bar',
        :max_size  => '1024'
      }}

      it { should compile.with_all_deps }
      it { should contain_class('snmpd') }
      it { should create_concat_fragment('snmpd+test_monitor_log_file.logmon') }
    end
  end
end
