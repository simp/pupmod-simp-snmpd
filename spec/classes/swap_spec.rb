require 'spec_helper'

describe 'snmpd::swap' do
  on_supported_os.each do |os, facts|
    let(:facts) do
      facts
    end

    context "on #{os}" do
      describe 'with default parameters' do
        it { is_expected.to create_class('snmpd::swap') }
        it { is_expected.to compile.with_all_deps }
        it { is_expected.to create_concat_fragment('snmpd+swap.load') }
      end
    end
  end
end
