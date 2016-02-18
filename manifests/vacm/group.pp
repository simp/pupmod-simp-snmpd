# == Define: snmpd::vacm::group
#
# Maps a security name (in the specified security model) into a named group. Several group
# directives can specify the same group name, allowing a single access setting to apply to
# several users and/or community strings.
#
# See snmpd.conf(5) for more details.
#
# == Notes
#
# - $sec_model defaults to 'usm' for SNMPv3
# - You will need two of these if using v1 and v2
#
# == Parameters
#
# [*group*]
# [*secname*]
# [*sec_model*]
#
# == Authors
#
# * Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::vacm::group (
  $group,
  $secname,
  $sec_model = 'usm'
) {
  include 'snmpd'

  concat_fragment { "snmpd+${name}.group":
    content => "group ${group} ${sec_model} ${secname}\n",
  }

  validate_array_member($sec_model, [
    'v1',
    'v2c',
    'usm',
    'tsm',
    'ksm'
  ])
}
