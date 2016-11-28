require 'spec_helper'

describe 'snmpd::diskusage::include_all_disks' do

  on_supported_os.each do |os, facts|
    let(:facts) do
      facts
    end

    context "on #{os}" do
      describe 'with specified parameter' do
        let(:params) {{ :minpercent => '70' }}
        it { is_expected.to create_class('snmpd::diskusage::include_all_disks') }
        it { is_expected.to compile.with_all_deps }
        it { is_expected.to create_simpcat_fragment('snmpd+all.disks') }
      end
    end
  end
end
