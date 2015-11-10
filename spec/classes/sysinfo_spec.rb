require 'spec_helper'

describe 'snmpd::sysinfo' do
  on_supported_os.each do |os, facts|
    let(:facts) do
      facts
    end

    context "on #{os}" do
      describe 'with default parameters' do
        it { should create_class('snmpd::sysinfo') }
        it { should compile.with_all_deps }
        it { should contain_concat_fragment('snmpd+info.system') }
      end
    end
  end
end
