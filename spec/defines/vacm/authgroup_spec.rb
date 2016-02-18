require 'spec_helper'

describe 'snmpd::vacm::authgroup' do
  on_supported_os.each do |os, base_facts|
    let(:facts) do
      base_facts.merge({ :interfaces => 'eth0' })
    end

    context "on #{os}" do
      let(:title) {'test_authgroup'}
      let(:params) {{
        :types => 'test_types',
        :group => 'test_group'
      }}

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('snmpd') }
      it { is_expected.to create_concat_fragment('snmpd+test_authgroup.authg') }
    end
  end
end
