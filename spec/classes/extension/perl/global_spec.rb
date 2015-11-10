require 'spec_helper'

describe 'snmpd::extension::perl::global' do
  on_supported_os.each do |os, facts|
    let(:facts) do
      facts
    end

    context "on #{os}" do
      describe 'with default parameters' do
        it { should create_class('snmpd::extension::perl::global') }
        it { should compile.with_all_deps }
        it { should contain_concat_fragment('snmpd+ext.perl.global') }
      end
    end
  end
end
