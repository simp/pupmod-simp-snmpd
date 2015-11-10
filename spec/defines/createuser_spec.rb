require 'spec_helper'

describe 'snmpd::createuser' do
  on_supported_os.each do |os, base_facts|
    let(:facts) do
      base_facts.merge({ :interfaces => 'eth0' })
    end

    context "on #{os}" do
      let(:title) {'test_user'}
      let(:params) {{
        :auth_phrase => 'test_auth_pass',
        :priv_phrase => 'test_priv_pass'
      }}
      it { should compile.with_all_deps }
      it { should create_concat_fragment('snmpd+test_user.user') }
      it { should contain_class('snmpd') }
    end
  end
end
