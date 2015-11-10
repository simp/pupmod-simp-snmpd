require 'spec_helper'

describe 'snmpd::authtrapenable' do
  on_supported_os.each do |os, facts|
    let(:facts) do
      facts
    end

    context "on #{os}" do
      describe 'with default parameters' do
        it { should create_class('snmpd::authtrapenable') }
        it { should compile.with_all_deps }
        it { should contain_concat_fragment('snmpd+all.authtrapenable') }
      end
    end
  end
end
