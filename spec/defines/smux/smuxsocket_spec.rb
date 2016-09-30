require 'spec_helper'

describe 'snmpd::smux::smuxsocket' do
  on_supported_os.each do |os, base_facts|
    let(:facts) do
      base_facts.merge({ :interfaces => 'eth0' })
    end

    context "on #{os}" do
      let(:title) {'test_smuxsocket'}
      let(:params) {{
        :ipv4_address  => '1.2.3.4',
        :allowed_nets  => '1.2.3.4/32'
      }}

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('snmpd') }
      it { is_expected.to create_simpcat_fragment('snmpd+socket.test_smuxsocket.smux') }
      it { is_expected.to create_iptables__add_tcp_stateful_listen('smux_test_smuxsocket') }
    end
  end
end
