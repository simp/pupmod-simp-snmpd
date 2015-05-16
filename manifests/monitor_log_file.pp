# == Define: snmpd::monitor_log_file
#
# This define sets up the 'file' option of the Log File Monitoring section of
# snmpd.conf.
#
# See snmpd.conf(5) 'Log File Monitoring' for more information.
#
# == Parameters
#
# [*name*]
#   Becomes part of the temp file path. Do not make '/' part of $name!
#
# [*file_path*]
# [*max_size*]
#
# == Authors
#
# * Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::monitor_log_file (
  $file_path,
  $max_size = ''
) {
  include 'snmpd'

  concat_fragment { "snmpd+${name}.logmon":
    content => "file $file_path $max_size\n"
  }
}
