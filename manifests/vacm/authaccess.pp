# == Define: snmpd::vacm::authaccess
#
# Sets up the VACM configuration for auth access. See smpd.conf(5) for more details.
#
# == Parameters
#
# [types*]
# [group*]
# [view*]
# [model*]
# [level*]
# [context*]
#
# == Authors
#
# * Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::vacm::authaccess (
  $types,
  $group,
  $view,
  $model = '',
  $level = '',
  $context = ''
) {
  include 'snmpd'

  simpcat_fragment { "snmpd+${name}.autha":
    content => template('snmpd/authaccess.erb')
  }
}
