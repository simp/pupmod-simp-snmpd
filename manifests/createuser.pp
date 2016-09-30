# == Define: snmpd::createuser
#
# Add the ability to create a user.
#
# See the 'SNMPv3 Users' section of snmpd.conf(5) for details.
#
# == Parameters
#
# [*name*]
#   The username applied into the system.
#
#  [*auth_phrase*]
#  [*priv_phrase*]
#  [*auth_type*]
#  [*priv_type*]
#  [*engine_id*]
#
# == Authors
#
# * Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::createuser (
  $auth_phrase,
  $priv_phrase,
  $auth_type = 'SHA',
  $priv_type = 'AES',
  $engine_id = ''
) {
  include 'snmpd'

  if empty($engine_id) {
    $lcontent =
      "createUser ${name} ${auth_type} ${auth_phrase} ${priv_type} ${priv_phrase}\n"
  }
  else {
    $lcontent =
      "createUser -e ${engine_id} ${name} ${auth_type} ${auth_phrase} ${priv_type} ${priv_phrase}\n"
  }

  simpcat_fragment { "snmpd+${name}.user":
    content => $lcontent
  }
}
