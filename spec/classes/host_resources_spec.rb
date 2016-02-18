require 'spec_helper'

describe 'snmpd::host_resources' do
  on_supported_os.each do |os, facts|
    let(:facts) do
      facts
    end

    context "on #{os}" do
      describe 'with default parameters' do
        it { is_expected.to create_class('snmpd::host_resources') }
        it { is_expected.to compile.with_all_deps }
        it { is_expected.to create_concat_fragment('snmpd+info.host_resources') }
      end
    end
  end
end
