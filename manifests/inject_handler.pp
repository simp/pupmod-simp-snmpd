# == Define: snmpd::inject_handler
#
# See the 'OTHER CONFIGURATION' section of snmpd.conf(5) for details.
#
# == Parameters
#
# [*name*]
#   Translates to HOST from the man page entry.
#
# [*handler_type*]
#   May be one of: stash_cache, debug, read_only, serialize, or bulk_to_next
#
# == Authors
#
# * Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::inject_handler (
  $handler_type,
  $modulename
) {
  include 'snmpd'

  concat_fragment { "snmpd+${name}.${handler_type}.inject":
    content => "injectHandler ${handler_type} ${modulename}\n"
  }

  validate_array_member($handler_type, [
    'stash_cache',
    'debug',
    'read_only',
    'serialize',
    'bulk_to_next'
  ])
}
