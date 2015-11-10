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

      it { should compile.with_all_deps }
      it { should contain_class('snmpd') }
      it { should create_concat_fragment('snmpd+test_procfix.procfix') }
    end
  end
end
