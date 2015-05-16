require 'spec_helper'

describe 'snmpd::smux::smuxsocket' do

  let(:title) {'test_smuxsocket'}
  let(:params) {{
    :ipv4_address  => '1.2.3.4',
    :allowed_nets  => '1.2.3.4/32'
  }}
  base_facts = {
    :interfaces => 'eth0'
  }
  let(:facts){base_facts}

  it { should compile.with_all_deps }
  it { should contain_class('snmpd') }
  it { should create_concat_fragment('snmpd+socket.test_smuxsocket.smux') }
  it { should create_iptables__add_tcp_stateful_listen('smux_test_smuxsocket') }
end
