require 'spec_helper'

describe 'snmpd::trapcommunity' do

  let(:title) {'test_trapcommunity'}
  base_facts = {
    :interfaces => 'eth0'
  }
  let(:facts){base_facts}

  it { should compile.with_all_deps }
  it { should contain_class('snmpd') }
  it { should create_concat_fragment('snmpd+test_trapcommunity.comstr') }
end
