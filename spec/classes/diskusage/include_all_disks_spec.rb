require 'spec_helper'

describe 'snmpd::diskusage::include_all_disks' do

  on_supported_os.each do |os, facts|
    let(:facts) do
      facts
    end

    context "on #{os}" do
      describe 'with default parameters' do
        it { should create_class('snmpd::diskusage::include_all_disks') }
        it { should compile.with_all_deps }
        it { should create_concat_fragment('snmpd+all.disks') }
      end
    end
  end
end
