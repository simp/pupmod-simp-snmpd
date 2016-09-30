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

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('snmpd') }
      it { is_expected.to create_simpcat_fragment('snmpd+test_override_override.other') }
    end
  end
end
