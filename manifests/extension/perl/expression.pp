# == Define: snmpd::extension::perl::expression
#
# Add a PERL expression or script for snmpd to evaluate.
#
# == Parameters
#
# [*name*]
#   Becomes part of the temp file path. Do not use '/' as part of $name.
#
# [*expression*]
#
# == Authors
#
# * Trevor Vaughan <mailto:tvaughan@onyxpont.com>
#
define snmpd::extension::perl::expression (
  $expression
) {
  include 'snmpd'

  simpcat_fragment { "snmpd+ext.perl.exp.${name}":
    content => "perl ${expression}\n"
  }
}
