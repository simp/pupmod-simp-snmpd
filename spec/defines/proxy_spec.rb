require 'spec_helper'

describe 'snmpd::proxy' do
  on_supported_os.each do |os, base_facts|
    let(:facts) do
      base_facts.merge({ :interfaces => 'eth0' })
    end

    context "on #{os}" do
      let(:title) {'test_proxy'}
      let(:params) {{
        :host => 'test.example.domain',
        :oid  => '1234567890'
      }}

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('snmpd') }
      it { is_expected.to create_simpcat_fragment('snmpd+test_proxy.proxy') }
    end
  end
end
