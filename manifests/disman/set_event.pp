# == Define: snmpd::disman::set_event
#
# See snmpd.conf(5) 'DisMan Event MIB' - setEvent for additional information.
#
# == Parameters
#
# [*name*]
#   This becomes ENAME from the man page.
#
# [*oid*]
# [*value*]
# [*dash_i*]
#     Setting this to true will set -I
#
# == Authors
#
# * Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::disman::set_event (
  $oid,
  $value,
  $dash_i = false
) {
  include 'snmpd'

  concat_fragment { "snmpd+disman.${name}.setevent":
    content =>
      inline_template("setEvent <%= @name %> <% if @dash_i then -%>-I <% end -%><%= @oid %> = <%= @value %>\n")
  }

  validate_bool($dash_i)
}
