require 'spec_helper'

describe 'snmpd::vacm::setaccess' do
  on_supported_os.each do |os, base_facts|
    let(:facts) do
      base_facts.merge({ :interfaces => 'eth0' })
    end

    context "on #{os}" do
      let(:title) {'test_setaccess'}
      let(:params) {{
        :group   => 'test_group',
        :context => 'test_context',
        :model   => 'test_model',
        :level   => 'test_level',
        :prefix  => 'test_prefix',
        :view    => 'test_view',
        :types   => 'test_types'
      }}

      it { should compile.with_all_deps }
      it { should contain_class('snmpd') }
      it { should create_concat_fragment('snmpd+test_setaccess.autha') }
    end
  end
end
