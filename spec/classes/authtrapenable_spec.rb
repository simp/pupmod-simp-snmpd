require 'spec_helper'

describe 'snmpd::authtrapenable' do
  on_supported_os.each do |os, facts|
    let(:facts) do
      facts
    end

    context "on #{os}" do
      describe 'with default parameters' do
        it { is_expected.to create_class('snmpd::authtrapenable') }
        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_concat_fragment('snmpd+all.authtrapenable') }
      end
    end
  end
end
