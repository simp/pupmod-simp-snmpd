# == Class: snmpd::disman::globals
#
# Configure the global DisMan Event MIB options.
#
# See snmpd.conf(5) 'DisMan Event MIB' for additional information.
#
# == Parameters
#
# [*iquery_sec_name*]
# [*agent_sec_name*]
# [*strict_disman*]
# [*link_up_down_notifications*]
# [*default_monitors*]
#
# == Authors
#
# * Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
class snmpd::disman::globals (
  $iquery_sec_name = '',
  $agent_sec_name = '',
  $strict_disman = false,
  $link_up_down_notifications = '',
  $default_monitors = ''
) {
  concat_fragment { 'snmpd+disman.globals':
    content => template('snmpd/disman_globals.erb')
  }

  validate_bool($strict_disman)
}
