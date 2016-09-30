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

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('snmpd') }
      it { is_expected.to create_simpcat_fragment('snmpd+disman.test_monitor.monitor') }
    end
  end
end
