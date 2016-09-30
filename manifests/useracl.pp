# == Define: snmpd::useracl
#
# Assign access controls
#
# See snmpd.conf(5) 'Traditional Access Control' for more detail.
#
# $name must be unique between trapsink, trap2sink, and informsink.
#
# This define shares its template with communityacl.
#
# == Parameters
#
# [*name*]
#   Not used, but should be unique.  This is so that a single user can be
#   assigned to multiple OIDs.
#
# [*user*]
# [*ro*]
#   Set to false to create a read/write user.
#
# [*sec_lvl*]
# [*oid*]
#
# == Authors
#
# * Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::useracl (
  $user,
  $ro = true,
  $sec_lvl = 'priv',
  $oid = ''
) {
  include 'snmpd'

  simpcat_fragment { "snmpd+${name}.auth":
    content => template('snmpd/acl.erb')
  }

  validate_bool($ro)
}
