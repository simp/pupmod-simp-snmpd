require 'spec_helper'

describe 'snmpd::disman::monitor' do

  on_supported_os.each do |os, base_facts|
    let(:facts) do
      base_facts.merge({ :interfaces => 'eth0' })
    end

    context "on #{os}" do
      let(:title) {'test_monitor'}
      let(:params) {{
        :expression => 'test_expression'
      }}

      it { should compile.with_all_deps }
      it { should contain_class('snmpd') }
      it { should create_concat_fragment('snmpd+disman.test_monitor.monitor') }
    end
  end
end
