# == Class: snmpd::utils::conf
#
# Configure /etc/snmp.conf for snmp client utilities.
#
# See snmp.conf(5) for details on all variables.
# /usr/share/snmp/mibs is always prepended onto the mibdirs.
# /usr/local/share/snmp/mibs is always appended to mibdirs.
#
# == Parameters
#
# [*default_port*]
# [*def_version*]
# [*def_community*]
# [*dump_packet*]
# [*do_debugging*]
# [*debug_tokens*]
# [*sixteen_bit_ids*]
# [*clientaddr*]
# [*client_recv_buf*]
# [*client_send_buf*]
# [*no_range_check*]
# [*no_token_warnings*]
# [*reverse_encode_BER*]
# [*def_security_name*]
# [*def_security_level*]
# [*def_passphrase*]
# [*def_auth_passphrase*]
# [*def_priv_passphrase*]
# [*def_auth_type*]
# [*def_priv_type*]
# [*def_context*]
# [*def_security_model*]
# [*def_auth_master_key*]
# [*def_auth_localized_key*]
# [*def_priv_master_key*]
# [*def_priv_localized_key*]
# [*mibdirs*]
# [*mibs*]
# [*show_mib_errors*]
# [*strict_comment_term*]
# [*mib_allow_underline*]
# [*mib_warning_level*]
# [*log_timestamp*]
# [*print_numeric_enums*]
# [*print_numeric_oids*]
# [*dont_breakdown_oids*]
# [*escape_quotes*]
# [*quick_printing*]
# [*print_value_only*]
# [*dont_print_units*]
# [*numeric_timeticks*]
# [*print_hex_text*]
# [*hex_output_length*]
# [*suffix_printing*]
# [*oid_output_format*]
# [*extended_index*]
# [*no_display_hint*]
# [*persistent_dir*]
# [*no_persistent_load*]
# [*no_persistent_save*]
# [*temp_file_pattern*]
# [*server_recv_buf*]
# [*server_send_buf*]
#
# == Authors
#
# * Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
class snmpd::utils::conf (
  $default_port = '',
  $def_version = '3',
  $def_community = 'public',
  $dump_packet = false,
  $do_debugging = false,
  $debug_tokens = [''],
  $sixteen_bit_ids = false,
  $clientaddr = '',
  $client_recv_buf = '',
  $client_send_buf = '',
  $no_range_check = false,
  $no_token_warnings = false,
  $reverse_encode_BER = '',
  $def_security_name = '',
  $def_security_level = 'authPriv',
  $def_passphrase = '',
  $def_auth_passphrase = '',
  $def_priv_passphrase = '',
  $def_auth_type = 'SHA',
  $def_priv_type = 'AES',
  $def_context = '',
  $def_security_model = '',
  $def_auth_master_key = '',
  $def_auth_localized_key = '',
  $def_priv_master_key = '',
  $def_priv_localized_key = '',
  $mibdirs = [''],
  $mibs = ['ALL'],
  $show_mib_errors = false,
  $strict_comment_term = '',
  $mib_allow_underline = true,
  $mib_warning_level = '',
  $log_timestamp = false,
  $print_numeric_enums = false,
  $print_numeric_oids = false,
  $dont_breakdown_oids = false,
  $escape_quotes = false,
  $quick_printing = false,
  $print_value_only = false,
  $dont_print_units = false,
  $numeric_timeticks = false,
  $print_hex_text = false,
  $hex_output_length = '',
  $suffix_printing = '',
  $oid_output_format = '',
  $extended_index = true,
  $no_display_hint = true,
  $persistent_dir = '',
  $no_persistent_load = false,
  $no_persistent_save = false,
  $temp_file_pattern = '',
  $server_recv_buf = '',
  $server_send_buf = ''
) {
  include 'snmpd'

  file { '/etc/snmp/snmp.conf':
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    content => template('snmpd/snmp.conf.erb'),
    notify  => Exec['set_snmp_perms']
  }

  validate_array($debug_tokens)
  validate_array($mibdirs)
  validate_array($mibs)
  validate_array_member($def_version, ['1','2c','3'])
  validate_array_member($def_security_level, ['noAuthNoPriv','authNoPriv','authPriv'])
  validate_array_member($def_auth_type, ['MD5','SHA'])
  validate_array_member($def_priv_type, ['DES','AES'])
  if !empty($suffix_printing) { validate_array_member($suffix_printing, ['0','1','2']) }
  if !empty($oid_output_format) { validate_array_member($oid_output_format, ['1','2','3','4','5','6']) }
  validate_bool($dump_packet)
  validate_bool($do_debugging)
  validate_bool($sixteen_bit_ids)
  validate_bool($no_range_check)
  validate_bool($no_token_warnings)
  validate_bool($show_mib_errors)
  validate_bool($mib_allow_underline)
  validate_bool($log_timestamp)
  validate_bool($print_numeric_enums)
  validate_bool($print_numeric_oids)
  validate_bool($dont_breakdown_oids)
  validate_bool($escape_quotes)
  validate_bool($quick_printing)
  validate_bool($print_value_only)
  validate_bool($dont_print_units)
  validate_bool($numeric_timeticks)
  validate_bool($print_hex_text)
  validate_bool($extended_index)
  validate_bool($no_display_hint)
  validate_bool($no_persistent_load)
  validate_bool($no_persistent_save)
  if !empty($client_recv_buf) { validate_integer($client_recv_buf) }
  if !empty($client_send_buf) { validate_integer($client_send_buf) }
  if !empty($mib_warning_level) { validate_integer($mib_warning_level) }
  if !empty($hex_output_length) { validate_integer($hex_output_length) }
  if !empty($server_recv_buf) { validate_integer($server_recv_buf) }
  if !empty($server_send_buf) { validate_integer($server_send_buf) }
  if !empty($default_port) { validate_port($default_port) }
}
