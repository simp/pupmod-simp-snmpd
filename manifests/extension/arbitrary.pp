# == Define: snmpd::extension::arbitrary
#
# See snmpd.conf(5) 'Arbitrary Extension Commands' for more information.
#
# == Parameters
#
# [*name*]
#   This becomes part of the temporary file path and will be used as NAME.
#   Do not use '/' in the $name
#
# [*ext_type*]
#   The type of extension you want to enable, choices are:
#     - exec
#     - sh
#     - execfix
#     - extend
#     - extendfix
#
# [*prog*]
# [*args*]
# [*miboid*]
#
# == Authors
#
# * Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::extension::arbitrary (
  $ext_type,
  $prog,
  $args,
  $miboid = ''
) {
  include 'snmpd'

  simpcat_fragment { "snmpd+ext.${name}.${ext_type}":
    content => template('snmpd/arbitrary_ext.erb')
  }

  validate_array_member($ext_type, [
    'exec',
    'sh',
    'execfix',
    'extend',
    'extendfix'
  ])
}
