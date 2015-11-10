require 'spec_helper'

describe 'snmpd::agentx::sub::conf' do
  on_supported_os.each do |os, facts|
    let(:facts) do
      facts
    end

    context "on #{os}" do
      describe 'with default parameters' do
        it { should create_class('snmpd::agentx::sub::conf') }
        it { should compile.with_all_deps }
        it { should create_concat_fragment('snmpd+sub.global.agentX') }
      end
    end
  end
end
