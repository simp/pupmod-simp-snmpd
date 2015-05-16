require 'spec_helper'

describe 'snmpd::disman::notification_event' do

  let(:title) {'test_notification_event'}
  let(:params) {{
    :notification => 'Test Notification'
  }}
  base_facts = {
    :interfaces => 'eth0'
  }
  let(:facts){base_facts}

  it { should compile.with_all_deps }
  it { should contain_class('snmpd') }
  it { should create_concat_fragment('snmpd+disman.test_notification_event.ne') }
end
