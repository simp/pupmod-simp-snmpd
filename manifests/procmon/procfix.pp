# == Define: snmpd::procmon
#
# Configure process monitoring.
#
# See snmpd.conf(5) 'Process Monitoring' for more information on this class.
# In all defines $name is mapped to NAME from the man page.
#
# == Parameters
#
# [*prog*]
# [*args*]
#
# == Authors
#
# * Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::procmon::procfix (
  $prog,
  $args
) {
  include 'snmpd'

  concat_fragment { "snmpd+${name}.procfix":
    content => "procfix ${name} ${prog} ${args}\n"
  }
}
