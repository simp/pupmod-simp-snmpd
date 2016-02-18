require 'spec_helper'

describe 'snmpd::load' do
  on_supported_os.each do |os, facts|
    let(:facts) do
      facts
    end

    context "on #{os}" do
      describe 'with default parameters' do
        it { is_expected.to create_class('snmpd::load') }
        it { is_expected.to compile.with_all_deps }
        it { is_expected.to create_concat_fragment('snmpd+mon.load') }
      end
    end
  end
end
