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

      it { should compile.with_all_deps }
      it { should contain_class('snmpd') }
      it { should create_concat_fragment('snmpd+ext.test_mib_specific.pass') }
    end
  end
end
