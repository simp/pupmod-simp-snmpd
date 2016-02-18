require 'spec_helper'

describe 'snmpd::agentx::master::perms' do
  on_supported_os.each do |os, facts|
    let(:facts) do
      facts
    end

    context "on #{os}" do
      it { is_expected.to create_class('snmpd::agentx::master::perms') }
      it { is_expected.to compile.with_all_deps }
      it { is_expected.to create_concat_fragment('snmpd+perms.agentX') }
    end
  end
end
