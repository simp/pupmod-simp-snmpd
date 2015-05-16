require 'spec_helper'

describe 'snmpd::authtrapenable' do

  it { should create_class('snmpd::authtrapenable') }
  it { should compile.with_all_deps }
  it { should contain_concat_fragment('snmpd+all.authtrapenable') }
end
