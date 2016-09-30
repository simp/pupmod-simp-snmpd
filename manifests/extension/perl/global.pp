# == Class: snmpd::extension::perl::global
#
# Configure the global parts of the Embedded Perl Support.
#
# See snmpd.conf(5) 'Embedded Perl Support'
#
# == Parameters
#
# [*disable_perl*]
# [*perl_init_file*]
#
# == Authors
#
# * Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
class snmpd::extension::perl::global (
  $disable_perl = '',
  $perl_init_file = ''
) {
  simpcat_fragment { 'snmpd+ext.perl.global':
    content => template('snmpd/perl_global.erb')
  }
}
