require 'spec_helper'

describe 'snmpd::communityacl' do
  on_supported_os.each do |os, base_facts|
    let(:facts){ base_facts.merge({ :community => 'foo_bar' }) }

    context "on #{os}" do
      let(:title) {'test_community'}
      let(:params) {{ :community => 'foo_bar' }}

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('snmpd') }

      context 'base' do
        it { is_expected.to create_concat_fragment('snmpd+test_community.comm') }
      end
    end
  end
end
