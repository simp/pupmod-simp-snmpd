require 'spec_helper'

describe 'snmpd::smux::smuxpeer' do
  on_supported_os.each do |os, base_facts|
    let(:facts) do
      base_facts.merge({ :interfaces => 'eth0' })
    end

    context "on #{os}" do
      let(:title) {'test_smuxpeer'}
      let(:params) {{
        :oid  => '1234567890',
        :pass => 'test_pass'
      }}

      it { should compile.with_all_deps }
      it { should contain_class('snmpd') }
      it { should create_concat_fragment('snmpd+peer.test_smuxpeer.smux') }
    end
  end
end
