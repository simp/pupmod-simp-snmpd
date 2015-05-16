require 'spec_helper'

describe 'snmpd::host_resources' do

  it { should create_class('snmpd::host_resources') }
  it { should compile.with_all_deps }
  it { should create_concat_fragment('snmpd+info.host_resources') }
end
