# == Define: snmpd::vacm::access
#
# Sets up the VACM configuration for auth access. See smpd.conf(5) for more details.
#
# == Parameters
#
# [*sec_model*]
#   One of any, v1, v2c, usm, tsm, ksm, and defaults to usm
#
# [*level*]
#   One of: noauth, auth, priv, and defaults to priv
#
# [*prefix*]
#   One of: exact, prefix, and defaults to exact
#
# == Authors
#
# * Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::vacm::access (
  $group,
  $context = '""',
  $sec_model = 'usm',
  $level = 'priv',
  $prefix = 'exact',
  $read = 'none',
  $write = 'none'
) {
  include 'snmpd'

  simpcat_fragment { "snmpd+${name}.access":
    content =>
      "access ${group} ${context} ${sec_model} ${level} ${prefix} ${read} ${write} none\n"
  }

  validate_array_member($sec_model, [
    'any',
    'v1',
    'v2c',
    'usm',
    'tsm',
    'ksm'
  ])
  validate_array_member($level, [
    'noauth',
    'auth',
    'priv'
  ])
  validate_array_member($prefix, [
    'exact',
    'prefix'
  ])
}
