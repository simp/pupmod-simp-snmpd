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

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('snmpd') }
      it { is_expected.to create_simpcat_fragment('snmpd+ext.perl.exp.test_expression') }
    end
  end
end
