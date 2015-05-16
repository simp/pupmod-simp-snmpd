require 'spec_helper'

describe 'snmpd::smux::smuxpeer' do

  let(:title) {'test_smuxpeer'}
  let(:params) {{
    :oid  => '1234567890',
    :pass => 'test_pass'
  }}
  base_facts = {
    :interfaces => 'eth0'
  }
  let(:facts){base_facts}

  it { should compile.with_all_deps }
  it { should contain_class('snmpd') }
  it { should create_concat_fragment('snmpd+peer.test_smuxpeer.smux') }
end
