require 'spec_helper'

describe 'snmpd::diskusage::disk' do

  let(:title) {'test_disk'}
  let(:params) {{
    :disk_path => '/test/disk/path'
  }}
  base_facts = {
    :interfaces => 'eth0'
  }
  let(:facts){base_facts}

  it { should compile.with_all_deps }
  it { should contain_class('snmpd') }
  it { should create_concat_fragment('snmpd+test_disk.disks') }
end
