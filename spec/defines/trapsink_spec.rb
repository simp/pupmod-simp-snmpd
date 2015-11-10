require 'spec_helper'

describe 'snmpd::trapsink' do
  on_supported_os.each do |os, base_facts|
    let(:facts) do
      base_facts
    end

    context "on #{os}" do
      let(:title) {'test_trapsink'}
      let(:params) {{
        :community => 'test_community',
        :port      => '12345'
      }}

      it { should compile.with_all_deps }
      it { should contain_class('snmpd') }
      it { should create_concat_fragment('snmpd+test_trapsink.trap.sink') }
    end
  end
end
