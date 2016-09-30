# == Define: snmpd::proxy
#
# See the 'Proxy Support' section of snmpd.conf(5) for details.
#
# == Parameters
#
# [*host*]
# [*oid*]
# [*context_name*]
# [*snmpcmd_args*]
# [*remote_oid*]
#
# == Authors
#
# * Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::proxy (
  $host,
  $oid,
  $context_name = '',
  $snmpcmd_args = '',
  $remote_oid = ''
) {
  include 'snmpd'

  simpcat_fragment { "snmpd+${name}.proxy":
    content => template('snmpd/proxy.erb')
  }
}
