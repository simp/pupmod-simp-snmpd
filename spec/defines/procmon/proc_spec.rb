require 'spec_helper'

describe 'snmpd::procmon::proc' do
  on_supported_os.each do |os, base_facts|
    let(:facts) do
      base_facts.merge({ :interfaces => 'eth0' })
    end

    context "on #{os}" do
      let(:title) {'test_proc'}
      let(:params) {{
        :max => '90',
        :min => '50'
      }}

      it { should compile.with_all_deps }
      it { should contain_class('snmpd') }
      it { should create_concat_fragment('snmpd+test_proc.proc') }
    end
  end
end
