require 'spec_helper'

describe 'snmpd::agentx::master::conf' do

  it { should create_class('snmpd::agentx::master::conf') }
  it { should compile.with_all_deps }
  it { should create_concat_fragment('snmpd+master.global.agentX') }
end
