require 'spec_helper'

describe 'snmpd::utils::mibfile' do

  let(:title) {'test_mibfile'}
  base_facts = {
    :interfaces => 'eth0'
  }
  let(:facts){base_facts}

  it { should compile.with_all_deps }
  it { should contain_class('snmpd') }
  it { should contain_simp_file_line('test_mibfile') }
end
