# == Define: snmpd::trapsess
#
# See the 'Notification Handling' section of snmpd.conf(5) for details.
#
# == Parameters
#
# [*name*]
#     Becomes HOST in the man page.
# [*snmpcmd_args*]
#
# == Authors
#
# * Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::trapsess (
  $snmpcmd_args = ''
) {
  include 'snmpd'

  concat_fragment { "snmpd+${name}.trapsess":
    content => "trapsess ${snmpcmd_args} ${name}\n"
  }
}
