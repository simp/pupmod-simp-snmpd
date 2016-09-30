# == Define: snmpd::dlmod
#
# Add the ability to load a dynamic module.
#
# See snmpd.conf(5) 'Dynamically Loadable Modules'.
#
# == Parameters
#
# [*name*]
#   NAME from the man page.
#
# [*path*]
#
# == Authors
#
# * Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::dlmod (
  $path
) {
  include 'snmpd'

  simpcat_fragment { "snmpd+${name}.module":
    content => "dlmod ${name} ${path}\n",
  }
}
