require 'spec_helper'

describe 'snmpd::disman::notification_event' do
  on_supported_os.each do |os, base_facts|
    let(:facts) do
      base_facts.merge({ :interfaces => 'eth0' })
    end

    context "on #{os}" do
      let(:title) {'test_notification_event'}
      let(:params) {{
        :notification => 'Test Notification'
      }}

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('snmpd') }
      it { is_expected.to create_concat_fragment('snmpd+disman.test_notification_event.ne') }
    end
  end
end
