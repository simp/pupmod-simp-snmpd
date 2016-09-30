require 'spec_helper'

describe 'snmpd::agentx::sub::conf' do
  on_supported_os.each do |os, facts|
    let(:facts) do
      facts
    end

    context "on #{os}" do
      describe 'with default parameters' do
        it { is_expected.to create_class('snmpd::agentx::sub::conf') }
        it { is_expected.to compile.with_all_deps }
        it { is_expected.to create_simpcat_fragment('snmpd+sub.global.agentX') }
      end
    end
  end
end
