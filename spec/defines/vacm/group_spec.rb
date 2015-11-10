require 'spec_helper'

describe 'snmpd::vacm::group' do
  on_supported_os.each do |os, base_facts|
    let(:facts) do
      base_facts.merge({ :interfaces => 'eth0' })
    end

    context "on #{os}" do
      let(:title) {'test_group'}
      let(:params) {{
        :group   => 'test_group',
        :secname => 'test_secname'
      }}

      it { should compile.with_all_deps }
      it { should contain_class('snmpd') }
      it { should create_concat_fragment('snmpd+test_group.group') }
    end
  end
end
