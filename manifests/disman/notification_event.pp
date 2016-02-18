# == Define: snmpd::disman::notification_event
#
# See snmpd.conf(5) 'DisMan Event MIB' for additional information.
#
# == Parameters
#
# [*name*]
#    This translates to ENAME from the man page.
#
# [*notification*]
# [*varbinds_options*]
#   Must be fully defined including the -n, -i, or -o as appropriate.
#
# == Authors
#
# * Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::disman::notification_event (
  $notification,
  $varbinds_options = ''
) {
  include 'snmpd'

  concat_fragment { "snmpd+disman.${name}.ne":
    content => "notificationEvent ${name} ${notification} ${::varbinds}\n"
  }
}
