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

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('snmpd') }
      it { is_expected.to create_simpcat_fragment('snmpd+test_monitor_log_file.logmon') }
    end
  end
end
