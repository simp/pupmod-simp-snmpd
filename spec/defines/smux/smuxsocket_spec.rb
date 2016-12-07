require 'spec_helper'

shared_examples_for 'a snmpd::snumx::smuxsocket' do
  it { is_expected.to compile.with_all_deps }
  it { is_expected.to contain_class('snmpd') }
  it { is_expected.to create_simpcat_fragment('snmpd+socket.test_smuxsocket.smux') }
end

describe 'snmpd::smux::smuxsocket' do
  on_supported_os.each do |os, base_facts|
    let(:facts) do
      base_facts.merge({ :interfaces => 'eth0' })
    end
    context "on #{os}" do
      let(:title) {'test_smuxsocket'}

      describe 'with default parameters' do
        let(:params) {{
          :ipv4_address  => '1.2.3.4',
          :trusted_nets  => [ '1.2.3.4/32' ]
        }}
        it_should_behave_like 'a snmpd::snumx::smuxsocket'
      end

      describe 'with firewall enabled' do
        let(:params) {{
          :ipv4_address  => '1.2.3.4',
          :trusted_nets  => [ '1.2.3.4/32' ],
          :firewall => true
        }}
        it_should_behave_like 'a snmpd::snumx::smuxsocket'
        it_should_behave_like 'a snmpd::snumx::smuxsocket'
        it { is_expected.to contain_class('iptables') }
        it { is_expected.to create_iptables__add_tcp_stateful_listen('smux_test_smuxsocket').with( 
          :trusted_nets => [ '1.2.3.4/32' ],
          :dports       => '199'
        )}
      end
    end
  end
end
