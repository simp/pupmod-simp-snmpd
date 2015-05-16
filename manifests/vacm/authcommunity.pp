# == Define: snmpd::vacm::authcommunity
#
# Sets up the authcommunity piece of the VACM Configuration. See snmpd.conf(5) for more details.
#
# == Parameters
#
# [*types*]
# [*community*]
# [*source*]
# [*oid*]
# [*view*]
#
# == Authors
#
# * Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::vacm::authcommunity (
  $types,
  $community,
  $source = '',
  $oid = '',
  $view = ''
) {
  include 'snmpd'

  concat_fragment { "snmpd+${name}.authc":
    content => template('snmpd/authview.erb')
  }
}
