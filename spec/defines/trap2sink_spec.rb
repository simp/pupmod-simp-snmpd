require 'spec_helper'

describe 'snmpd::trap2sink' do
  on_supported_os.each do |os, base_facts|
    let(:facts) do
      base_facts.merge({ :interfaces => 'eth0' })
    end

    context "on #{os}" do
      let(:title) {'test_trap2sink'}
      let(:params) {{
        :community => 'test_community',
        :port      => '12345'
      }}

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('snmpd') }
      it { is_expected.to create_simpcat_fragment('snmpd+test_trap2sink.trap2.sink') }
    end
  end
end
