require 'spec_helper'

describe 'snmpd::vacm::access' do
  on_supported_os.each do |os, base_facts|
    let(:facts) do
      base_facts.merge({ :interfaces => 'eth0' })
    end

    context "on #{os}" do
      let(:title) {'test_access'}
      let(:params) {{
        :group => 'test_group'
      }}

      it { should compile.with_all_deps }
      it { should contain_class('snmpd') }
      it { should create_concat_fragment('snmpd+test_access.access') }
    end
  end
end
