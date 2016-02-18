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

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('snmpd') }
      it { is_expected.to create_concat_fragment('snmpd+test_proc.proc') }
    end
  end
end
