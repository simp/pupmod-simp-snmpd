require 'spec_helper'

describe 'snmpd::override' do
  on_supported_os.each do |os, base_facts|
    let(:facts) do
      base_facts.merge({ :interfaces => 'eth0' })
    end

    context "on #{os}" do
      let(:title) {'test_override'}
      let(:params) {{
        :oid     => '1234567890',
        :or_type => 'foo',
        :value   => 'bar'
      }}

      it { should compile.with_all_deps }
      it { should contain_class('snmpd') }
      it { should create_concat_fragment('snmpd+test_override_override.other') }
    end
  end
end
