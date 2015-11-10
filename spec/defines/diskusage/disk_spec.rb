require 'spec_helper'

describe 'snmpd::diskusage::disk' do
  on_supported_os.each do |os, base_facts|
    let(:facts) do
      base_facts.merge({ :interfaces => 'eth0' })
    end

    context "on #{os}" do
      let(:title) {'test_disk'}
      let(:params) {{
        :disk_path => '/test/disk/path'
      }}

      it { should compile.with_all_deps }
      it { should contain_class('snmpd') }
      it { should create_concat_fragment('snmpd+test_disk.disks') }
    end
  end
end
