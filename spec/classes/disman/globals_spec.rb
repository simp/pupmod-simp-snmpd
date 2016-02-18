require 'spec_helper'

describe 'snmpd::disman::globals' do
  on_supported_os.each do |os, facts|
    let(:facts) do
      facts
    end

    context "on #{os}" do
      describe 'with default parameters' do
        it { is_expected.to create_class('snmpd::disman::globals') }
        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_concat_fragment('snmpd+disman.globals') }
      end
    end
  end
end
