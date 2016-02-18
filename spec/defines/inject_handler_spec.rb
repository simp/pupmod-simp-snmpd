require 'spec_helper'

describe 'snmpd::inject_handler' do
  on_supported_os.each do |os, base_facts|
    let(:facts) do
      base_facts.merge({ :interfaces => 'eth0' })
    end

    context "on #{os}" do
      let(:title) {'test_inject_handler'}
      let(:params) {{
        :handler_type => 'debug',
        :modulename   => 'test_module'
      }}

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('snmpd') }
      it { is_expected.to create_concat_fragment('snmpd+test_inject_handler.debug.inject') }
    end
  end
end
