# == Define: snmpd::logmatch
#
# See the 'Log File Monitoring' section of snmpd.conf(5) for details.
#
# You'll probably want to put your regex in single quotes.
#
# == Parameters
#
# [*name*]
#   Maps to NAME from the man page.
#
# [*file_path*]
# [*cycle_time*]
# [*regex*]
#
# == Authors
#
# * Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::logmatch (
  $file_path,
  $cycle_time,
  $regex
) {
  include 'snmpd'

  concat_fragment { "snmpd+${name}.logmatch":
    content => "logmatch $name $file_path $cycle_time $regex\n"
  }
}
