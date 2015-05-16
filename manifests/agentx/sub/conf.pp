# == Class: snmpd::agentx::sub::conf
#
# Create the AgentX subagent.
#
# See snmpd.conf(5) AgentX Sub-Agents for additional information.
#
# == Parameters
#
# [*agentx_ping_interval*]
# [*agentx_timeout*]
# [*agentx_retries*]
#
# == Authors
#
# * Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
class snmpd::agentx::sub::conf (
  $agentx_ping_interval,
  $agentx_timeout = '',
  $agentx_retries = ''
) {
  concat_fragment { 'snmpd+sub.global.agentX':
    content => template('snmpd/agentX.erb')
  }

  if !empty($agentx_timeout) {
    validate_integer($agentx_timeout)
  }
  if !empty($agentx_retries) {
    validate_integer($agentx_retries)
  }
}
