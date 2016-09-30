# == Define: snmpd::override
#
# See the 'OTHER CONFIGURATION' section of snmpd.conf(5) for details.
#
# Allows you to override a particular OID with a different value.
#
# == Parameters
#
# [*name*]
#   Becomes part of the temp file path. Do not use '/' as part of $name.
# [*oid*]
# [*or_type*]
# [*value*]
# [*rw*]
#   If set to true, will set the -rw flag on the override option.
#
# == Authors
#
# * Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::override (
  $oid,
  $or_type,
  $value,
  $rw = false
) {
  include 'snmpd'

  simpcat_fragment { "snmpd+${name}_override.other":
    content =>
      inline_template("override <% if @rw then %>-rw <% end %><%= @oid %> <%= @or_type %> <%= @value %>\n")
  }

  validate_bool($rw)
}
