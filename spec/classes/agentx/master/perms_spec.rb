require 'spec_helper'

describe 'snmpd::agentx::master::perms' do
  on_supported_os.each do |os, facts|
    let(:facts) do
      facts
    end

    context "on #{os}" do
      it { should create_class('snmpd::agentx::master::perms') }
      it { should compile.with_all_deps }
      it { should create_concat_fragment('snmpd+perms.agentX') }
    end
  end
end
