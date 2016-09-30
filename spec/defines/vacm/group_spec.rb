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

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('snmpd') }
      it { is_expected.to create_simpcat_fragment('snmpd+test_group.group') }
    end
  end
end
