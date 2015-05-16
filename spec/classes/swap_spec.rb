require 'spec_helper'

describe 'snmpd::swap' do

  it { should create_class('snmpd::swap') }
  it { should compile.with_all_deps }
  it { should create_concat_fragment('snmpd+swap.load') }
end
