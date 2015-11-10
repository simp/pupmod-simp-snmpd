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

      it { should compile.with_all_deps }
      it { should create_concat_fragment('snmpd+test_dlmod.module') }
      it { should contain_class('snmpd') }
    end
  end
end
