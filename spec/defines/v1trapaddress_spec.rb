require 'spec_helper'

describe 'snmpd::v1trapaddress' do
  on_supported_os.each do |os, base_facts|
    let(:facts) do
      base_facts
    end

    context "on #{os}" do
      let(:title) {'test_v1trapaddress'}

      it { should compile.with_all_deps }
      it { should contain_class('snmpd') }
      it { should create_concat_fragment('snmpd+all.v1trapaddress') }
    end
  end
end
