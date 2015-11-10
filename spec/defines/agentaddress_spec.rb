require 'spec_helper'

describe 'snmpd::agentaddress' do

  on_supported_os.each do |os, base_facts|
    let(:facts) do
      base_facts.merge({ :interfaces => 'eth0' })
    end

    context "on #{os}" do
      describe 'with default parameters' do
        let(:title) {'test'}
        it { should compile.with_all_deps }
        it { should contain_class('snmpd') }

        context 'base' do
          it { should create_concat_fragment('snmpd_agentaddress+test.agentaddress') }
          it { should contain_iptables__add_udp_listen('snmpd_test_udp_listen') }
        end
      end
    end
  end
end
