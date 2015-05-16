require 'spec_helper'

describe 'snmpd::diskusage::include_all_disks' do

  it { should create_class('snmpd::diskusage::include_all_disks') }
  it { should compile.with_all_deps }
  it { should create_concat_fragment('snmpd+all.disks') }
end
