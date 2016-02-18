# == Define: snmpd::informsink
#
# Add the ability to create a user.
#
# See the 'Notification Handling' section of snmpd.conf(5) for details.
#
# $name must be unique between trapsink, trap2sink, and informsink.
#
# == Parameters
#
# [*name*]
#   Translates to HOST from the man page entry.
#
# [*community*]
# [*port*]
#
# == Authors
#
# * Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::informsink (
  $community = '',
  $port = ''
) {
  include 'snmpd'

  concat_fragment { "snmpd+${name}.inform.sink":
    content => "informsink ${name} ${community} ${port}\n"
  }
}
