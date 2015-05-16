require 'spec_helper'

describe 'snmpd::agentx::master::perms' do

  it { should create_class('snmpd::agentx::master::perms') }
  it { should compile.with_all_deps }
  it { should create_concat_fragment('snmpd+perms.agentX') }
end
