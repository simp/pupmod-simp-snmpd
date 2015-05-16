require 'spec_helper'

describe 'snmpd::agentx::sub::conf' do

  it { should create_class('snmpd::agentx::sub::conf') }
  it { should compile.with_all_deps }
  it { should create_concat_fragment('snmpd+sub.global.agentX') }
end
