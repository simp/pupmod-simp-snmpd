# == Define: snmpd::v1trapaddress
#
# See the 'Notification Handling' section of snmpd.conf(5) for details.
#
# == Parameters
#
# $name
#     Becomes HOST from the man page.
#
# == Authors
#
# * Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::v1trapaddress {
  include 'snmpd'

  concat_fragment { 'snmpd+all.v1trapaddress':
    content => "v1trapaddress ${name}\n"
  }
}
