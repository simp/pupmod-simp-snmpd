# == Define: snmpd::vacm::com2sec
#
# Maps an SNMPv1 or SNMPv2c community string to a security name -  either  from  a  particular
# range  of  source  addresses, or globally ("default").  A restricted source can either be a
# specific  hostname  (or  address),  or  a   subnet   -   represented   as   IP/MASK   (e.g.
# 10.10.10.0/255.255.255.0), or IP/BITS (e.g. 10.10.10.0/24), or the IPv6 equivalents
#
# See snmpd.conf(5) for more details.
#
# == Notes
#
# - This is only used for SNMPv1 or SNMPv2
# - Set $ipv6 to true to enable com2sec6
# - Set $sockpath to enable com2secunix
# - $sockpath overrides $ipv6
#
# == Parameters
#
# [*secname*]
# [*community*]
# [*context*]
# [*source*]
# [*ipv6*]
# [*sockpath*]
#
# == Authors
#
# * Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::vacm::com2sec (
  $secname,
  $community,
  $context = '',
  $source = 'default',
  $ipv6 = false,
  $sockpath = ''
) {
  include 'snmpd'

  concat_fragment { "snmpd+${name}.com2sec":
    content => template('snmpd/com2sec.erb')
  }

  validate_bool($ipv6)
}
