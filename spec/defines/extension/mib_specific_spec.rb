require 'spec_helper'

describe 'snmpd::extension::mib_specific' do
  on_supported_os.each do |os, base_facts|
    let(:facts) do
      base_facts.merge({ :interfaces => 'eth0' })
    end

    context "on #{os}" do
      let(:title) {'test_mib_specific'}
      let(:params) {{
        :ext_type => 'pass',
        :miboid   => '1234567890',
        :prog     => 'test_program'
      }}

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('snmpd') }
      it { is_expected.to create_simpcat_fragment('snmpd+ext.test_mib_specific.pass') }
    end
  end
end
