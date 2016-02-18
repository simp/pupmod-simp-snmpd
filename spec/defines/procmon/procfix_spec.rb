require 'spec_helper'

describe 'snmpd::procmon::procfix' do
  on_supported_os.each do |os, base_facts|
    let(:facts) do
      base_facts.merge({ :interfaces => 'eth0' })
    end

    context "on #{os}" do

      let(:title) {'test_procfix'}
      let(:params) {{
        :prog => 'test_program',
        :args => 'foo,bar,baz'
      }}

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('snmpd') }
      it { is_expected.to create_concat_fragment('snmpd+test_procfix.procfix') }
    end
  end
end
