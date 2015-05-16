require 'spec_helper'

describe 'snmpd::extension::perl::global' do

  it { should create_class('snmpd::extension::perl::global') }
  it { should compile.with_all_deps }
  it { should contain_concat_fragment('snmpd+ext.perl.global') }
end
