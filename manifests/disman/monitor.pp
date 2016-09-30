# == Define: snmpd::disman::monitor
#
# Set up an item to monitor.
#
# See snmpd.conf(5) 'DisMan Event MIB' for additional information.
#
# == Parameters
#
# $name
#   This translates to 'NAME' from the man page.
#
# [*expression*]
# [*options*]
#
# == Authors
#
# * Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::disman::monitor (
  $expression,
  $options = ''
) {
  include 'snmpd'

  simpcat_fragment { "snmpd+disman.${name}.monitor":
    content => "monitor ${options} ${name} ${expression}\n",
  }
}
