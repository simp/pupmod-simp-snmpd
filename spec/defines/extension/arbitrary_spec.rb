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

      it { should compile.with_all_deps }
      it { should contain_class('snmpd') }
      it { should create_concat_fragment('snmpd+ext.test_arbitrary.exec') }
    end
  end
end
