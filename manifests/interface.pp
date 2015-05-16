# == Define: snmpd::interface
#
# Provide interface type and speed settings.
#
# See snmpd.conf(5) 'Interfaces Group' for additional information.
#
# == Parameters
#
# [*name*]
#   Maps to NAME in the man page.
#
# [*type*]
# [*speed*]
#
# == Authors
#
# * Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::interface (
  $type,
  $speed
) {
  include 'snmpd'

  concat_fragment { "snmpd+${name}.iface":
    content => "interface $name $type $speed\n",
  }
}
