# == Define: snmpd::trapcommunity
#
# See the 'Notification Handling' section of snmpd.conf(5) for details.
#
# == Parameters
#
# [*name*]
#     Becomes the community string
#
# == Authors
#
# * Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::trapcommunity {
  include 'snmpd'

  concat_fragment { "snmpd+${name}.comstr":
    content => "trapcommunity $name\n"
  }
}
