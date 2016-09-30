# == Class: snmpd::agentx::master::perms
#
# Set up the AgentX Sub-Agent permissions.
#
# See snmpd.conf(5) AgentX Sub-Agents for more information.
#
# == Parameters
#
# [*sockperms*]
# [*dirperms*]
# [*user*]
# [*group*]
#
# == Authors
#
# * Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
class snmpd::agentx::master::perms (
  $sockperms,
  $dirperms = '',
  $user = '',
  $group = ''
) {

  simpcat_fragment { 'snmpd+perms.agentX':
    content => template('snmpd/agentX_perms.erb')
  }
}
