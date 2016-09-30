require 'spec_helper'

describe 'snmpd::sysinfo' do
  on_supported_os.each do |os, facts|
    let(:facts) do
      facts
    end

    context "on #{os}" do
      describe 'with default parameters' do
        it { is_expected.to create_class('snmpd::sysinfo') }
        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_simpcat_fragment('snmpd+info.system') }
      end
    end
  end
end
