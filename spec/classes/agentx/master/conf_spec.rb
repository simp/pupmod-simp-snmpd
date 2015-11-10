require 'spec_helper'

describe 'snmpd::agentx::master::conf' do
  on_supported_os.each do |os, facts|
    let(:facts) do
      facts
    end

    context "on #{os}" do
      describe 'with default parameters' do
        it { should create_class('snmpd::agentx::master::conf') }
        it { should compile.with_all_deps }
        it { should create_concat_fragment('snmpd+master.global.agentX') }
      end
    end
  end
end
