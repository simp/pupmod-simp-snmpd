require 'spec_helper'

describe 'snmpd::utils::mibfile' do
  on_supported_os.each do |os, base_facts|
    let(:facts) do
      base_facts
    end

    context "on #{os}" do
      let(:title) {'test_mibfile'}

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('snmpd') }
      it { is_expected.to contain_simp_file_line('test_mibfile') }
    end
  end
end
