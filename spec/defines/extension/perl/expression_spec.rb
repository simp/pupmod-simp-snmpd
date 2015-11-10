require 'spec_helper'

describe 'snmpd::extension::perl::expression' do
  on_supported_os.each do |os, base_facts|
    let(:facts) do
      base_facts.merge({ :interfaces => 'eth0' })
    end

    context "on #{os}" do
      let(:title) {'test_expression'}
      let(:params) {{
        :expression => 'exec'
      }}

      it { should compile.with_all_deps }
      it { should contain_class('snmpd') }
      it { should create_concat_fragment('snmpd+ext.perl.exp.test_expression') }
    end
  end
end
