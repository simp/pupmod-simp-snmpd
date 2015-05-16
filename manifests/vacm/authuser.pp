# == Define: snmpd::vacm::authuser
#
# Sets up the authuser piece of the VAMC Configuration. See snmpd.conf(5) for more details.
#
# == Parameters
#
# [*types*]
# [*user*]
# [*model*]
# [*level*]
# [*oid*]
# [*view*]
#
# == Authors
#
# * Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::vacm::authuser (
  $types,
  $user,
  $model = '',
  $level = '',
  $oid = '',
  $view = ''
) {
  include 'snmpd'

  concat_fragment { "snmpd+${name}.authu":
    content => template('snmpd/authview.erb')
  }
}
