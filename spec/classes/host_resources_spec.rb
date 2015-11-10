require 'spec_helper'

describe 'snmpd::host_resources' do
  on_supported_os.each do |os, facts|
    let(:facts) do
      facts
    end

    context "on #{os}" do
      describe 'with default parameters' do
        it { should create_class('snmpd::host_resources') }
        it { should compile.with_all_deps }
        it { should create_concat_fragment('snmpd+info.host_resources') }
      end
    end
  end
end
