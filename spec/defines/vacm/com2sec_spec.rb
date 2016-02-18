require 'spec_helper'

describe 'snmpd::vacm::com2sec' do
  on_supported_os.each do |os, base_facts|
    let(:facts) do
      base_facts.merge({ :interfaces => 'eth0' })
    end

    context "on #{os}" do
      let(:title) {'test_com2sec'}
      let(:params) {{
        :secname   => 'test_secname',
        :community => 'test_community'
      }}

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('snmpd') }
      it { is_expected.to create_concat_fragment('snmpd+test_com2sec.com2sec') }
    end
  end
end
