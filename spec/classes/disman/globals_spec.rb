require 'spec_helper'

describe 'snmpd::disman::globals' do
  on_supported_os.each do |os, facts|
    let(:facts) do
      facts
    end

    context "on #{os}" do
      describe 'with default parameters' do
        it { should create_class('snmpd::disman::globals') }
        it { should compile.with_all_deps }
        it { should contain_concat_fragment('snmpd+disman.globals') }
      end
    end
  end
end
