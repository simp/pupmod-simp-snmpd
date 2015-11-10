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

      it { should compile.with_all_deps }
      it { should contain_class('snmpd') }
      it { should create_concat_fragment('snmpd+disman.test_notification_event.ne') }
    end
  end
end
