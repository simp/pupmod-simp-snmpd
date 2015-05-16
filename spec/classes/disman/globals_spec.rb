require 'spec_helper'

describe 'snmpd::disman::globals' do

  it { should create_class('snmpd::disman::globals') }
  it { should compile.with_all_deps }
  it { should contain_concat_fragment('snmpd+disman.globals') }
end
