require 'spec_helper'

describe 'snmpd::extension::arbitrary' do
  on_supported_os.each do |os, base_facts|
    let(:facts) do
      base_facts.merge({ :interfaces => 'eth0' })
    end

    context "on #{os}" do
      let(:title) {'test_arbitrary'}
      let(:params) {{
        :ext_type => 'exec',
        :prog     => 'test_prog',
        :args     => 'foo,bar,baz'
      }}

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('snmpd') }
      it { is_expected.to create_simpcat_fragment('snmpd+ext.test_arbitrary.exec') }
    end
  end
end
