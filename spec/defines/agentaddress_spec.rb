require 'spec_helper'

shared_examples_for 'a snmpd::agendaddress' do
  it { is_expected.to compile.with_all_deps }
  it { is_expected.to contain_class('snmpd') }
  it { is_expected.to create_simpcat_fragment('snmpd_agentaddress+test.agentaddress') }
end

describe 'snmpd::agentaddress' do

  on_supported_os.each do |os, base_facts|
    let(:facts) do
      base_facts.merge({ :interfaces => 'eth0' })
    end
    let(:title) {'test'}

    context "on #{os}" do
      describe 'with default parameters' do
        it_should_behave_like 'a snmpd::agendaddress'
      end

      describe 'with firewall enabled and udp' do
        let(:params) {{
          :firewall            => true,
          :transport_specifier => 'udp'
        }}
        it_should_behave_like 'a snmpd::agendaddress'
        it { is_expected.to contain_class('iptables') }
        it { is_expected.to contain_iptables__add_udp_listen('snmpd_test_udp_listen').with(
          :trusted_nets => ['1.2.3.4/32'],
          :dports       => '161',
          :apply_to     => 'ipv4'
        )}
      end

      describe 'with firewall enabled and tcp' do
        let(:params) {{
          :firewall            => true,
          :transport_specifier => 'tcp'
        }}
        it_should_behave_like 'a snmpd::agendaddress'
        it { is_expected.to contain_class('iptables') }
        it { is_expected.to contain_iptables__add_tcp_stateful_listen('snmpd_test_tcp_listen').with(
          :trusted_nets => ['1.2.3.4/32'],
          :dports       => '161',
          :apply_to     => 'ipv4'
        )}
      end

      describe 'with firewall enabled and udp6' do
        let(:params) {{
          :firewall            => true,
          :transport_specifier => 'udp6',
          :trusted_nets        => ['2001:db8:a::/64']
        }}
        it_should_behave_like 'a snmpd::agendaddress'
        it { is_expected.to contain_class('iptables') }
        it { is_expected.to contain_iptables__add_udp_listen('snmpd_test_udp6_listen').with(
          :trusted_nets => ['2001:db8:a::/64'],
          :dports       => '161',
          :apply_to     => 'ipv6'
        )}
      end

      describe 'with firewall enabled and tcp6' do
        let(:params) {{
          :firewall            => true,
          :transport_specifier => 'tcp6',
          :trusted_nets        => ['2001:db8:a::/64']
        }}
        it_should_behave_like 'a snmpd::agendaddress'
        it { is_expected.to contain_class('iptables') }
        it { is_expected.to contain_iptables__add_tcp_stateful_listen('snmpd_test_tcp6_listen').with(
          :trusted_nets => ['2001:db8:a::/64'],
          :dports       => '161',
          :apply_to     => 'ipv6'
        )}
      end
    end
  end
end
