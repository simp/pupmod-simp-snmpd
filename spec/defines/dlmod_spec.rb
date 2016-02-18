require 'spec_helper'

describe 'snmpd::dlmod' do
  on_supported_os.each do |os, base_facts|
    let(:facts) do
      base_facts.merge({ :interfaces => 'eth0' })
    end

    context "on #{os}" do
      let(:title) {'test_dlmod'}
      let(:params) {{
        :path => '/test/path/foo/bar'
      }}

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to create_concat_fragment('snmpd+test_dlmod.module') }
      it { is_expected.to contain_class('snmpd') }
    end
  end
end
