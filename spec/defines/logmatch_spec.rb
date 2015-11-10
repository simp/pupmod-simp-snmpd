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

      it { should compile.with_all_deps }
      it { should contain_class('snmpd') }
      it { should create_concat_fragment('snmpd+test_logmatch.logmatch') }
    end
  end
end
