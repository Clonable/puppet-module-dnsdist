# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
define dnsdist::acl (
  String $address,
){

  include ::dnsdist::params

  $order = '20'

  # Template uses $address, $cluster_name
  concat::fragment { "acl-${title}":
    order   => $order,
    target  => $dnsdist::params::config_file,
    content => template('dnsdist/dnsdist_acl.erb'),
  }
}
