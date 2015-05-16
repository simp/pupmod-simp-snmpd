# == Define: snmpd::vacm::authgroup
#
# Sets up the authgroup piece of the VACM Configuration. See snmpd.conf(5) for more details.
#
# == Parameters
#
# [*types*]
# [*group*]
# [*model*]
# [*level*]
# [*oid*]
# [*view*]
#
# == Authors
#
# * Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::vacm::authgroup (
  $types,
  $group,
  $model = '',
  $level = '',
  $oid = '',
  $view = ''
) {
  include 'snmpd'

  concat_fragment { "snmpd+${name}.authg":
    content => template('snmpd/authview.erb')
  }

  if !empty($level) { validate_array_member($level, ['noauth','priv']) }
}
