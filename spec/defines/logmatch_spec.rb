require 'spec_helper'

describe 'snmpd::logmatch' do
  on_supported_os.each do |os, base_facts|
    let(:facts) do
      base_facts.merge({ :interfaces => 'eth0' })
    end

    context "on #{os}" do
      let(:title) {'test_logmatch'}
      let(:params) {{
        :file_path  => '/test/path/foo/bar',
        :cycle_time => '60',
        :regex      => '^test*'
      }}

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('snmpd') }
      it { is_expected.to create_concat_fragment('snmpd+test_logmatch.logmatch') }
    end
  end
end
