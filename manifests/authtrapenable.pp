# == Class: snmpd::authtrapenable
#
# Whether or not to generate authentication failure traps.
#
# See snmpd.conf(5) - 'ACTIVE MONITORING > Notification Handling' for details.
#
# == Parameters
#
# [*enable*]
#   The value to assign to authtrapenable.
#   Set to 2 -> disabled by default.
#
class snmpd::authtrapenable (
  $enable = false
) {
  validate_bool($enable)

  $l_enable = $enable ? {
    true    => '1',
    default => '2'
  }

  concat_fragment { 'snmpd+all.authtrapenable':
    content => "authtrapenable ${l_enable}\n"
  }
}
