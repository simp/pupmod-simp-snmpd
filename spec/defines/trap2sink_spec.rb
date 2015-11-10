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

      it { should compile.with_all_deps }
      it { should contain_class('snmpd') }
      it { should create_concat_fragment('snmpd+test_trap2sink.trap2.sink') }
    end
  end
end
