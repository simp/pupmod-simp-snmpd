require 'spec_helper'

describe 'snmpd::sysinfo' do

  it { should create_class('snmpd::sysinfo') }
  it { should compile.with_all_deps }
  it { should contain_concat_fragment('snmpd+info.system') }
end
