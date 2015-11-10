require 'spec_helper'

describe 'snmpd::interface' do
  on_supported_os.each do |os, base_facts|
    let(:facts) do
      base_facts.merge({ :interfaces => 'eth0' })
    end

    context "on #{os}" do
      let(:title) {'test_interface'}
      let(:params) {{
        :type  => 'ethernet',
        :speed => '1000'
      }}

      it { should compile.with_all_deps }
      it { should contain_class('snmpd') }
      it { should create_concat_fragment('snmpd+test_interface.iface') }
    end
  end
end
