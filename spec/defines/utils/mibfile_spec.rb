require 'spec_helper'

describe 'snmpd::utils::mibfile' do
  on_supported_os.each do |os, base_facts|
    let(:facts) do
      base_facts
    end

    context "on #{os}" do
      let(:title) {'test_mibfile'}

      it { should compile.with_all_deps }
      it { should contain_class('snmpd') }
      it { should contain_simp_file_line('test_mibfile') }
    end
  end
end
