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

      it { should compile.with_all_deps }
      it { should contain_class('snmpd') }
      it { should create_concat_fragment('snmpd+test_com2sec.com2sec') }
    end
  end
end
