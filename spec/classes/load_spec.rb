require 'spec_helper'

describe 'snmpd::load' do

  it { should create_class('snmpd::load') }
  it { should compile.with_all_deps }
  it { should create_concat_fragment('snmpd+mon.load') }
end
