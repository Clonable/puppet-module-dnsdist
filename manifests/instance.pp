# @summary This class manages the dnsdist instance
#
#
define dnsdist::instance (
  String $address = '127.0.0.1:53',
  Array[String] $additional_addresses = [],
){
  include ::dnsdist::params

  $order = '10-instance';

  # Template uses $address, $cluster_name
  concat::fragment { 'dnsdist_instance':
    order   => $order,
    target  => $dnsdist::params::config_file,
    content => template('dnsdist/dnsdist_instance.erb'),
  }
}
