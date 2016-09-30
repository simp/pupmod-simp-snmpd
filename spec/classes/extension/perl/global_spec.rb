require 'spec_helper'

describe 'snmpd::extension::perl::global' do
  on_supported_os.each do |os, facts|
    let(:facts) do
      facts
    end

    context "on #{os}" do
      describe 'with default parameters' do
        it { is_expected.to create_class('snmpd::extension::perl::global') }
        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_simpcat_fragment('snmpd+ext.perl.global') }
      end
    end
  end
end
