require 'spec_helper'

describe 'snmpd::agentaddress' do

  let(:title) {'test'}

  base_facts = {
    :interfaces => 'eth0'
  }
  let(:facts){base_facts}

  it { should compile.with_all_deps }
  it { should contain_class('snmpd') }

  context 'base' do
    it { should create_concat_fragment('snmpd_agentaddress+test.agentaddress') }
    it { should contain_iptables__add_udp_listen('snmpd_test_udp_listen') }
  end
end
