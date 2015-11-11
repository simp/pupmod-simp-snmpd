require 'spec_helper'

describe 'snmpd::disman::sched::repeat' do
  on_supported_os.each do |os, base_facts|
    let(:facts) do
      base_facts.merge({ :interfaces => 'eth0' })
    end

    context "on #{os}" do

      let(:title) {'test_repeat'}
      let(:params) {{
        :frequency => 'weekly',
        :oid       => '1234567890',
        :value     => 'test_value'
      }}

      it { should compile.with_all_deps }
      it { should contain_class('snmpd') }
      it { should create_concat_fragment('snmpd+disman.test_repeat.sched') }
    end
  end
end
