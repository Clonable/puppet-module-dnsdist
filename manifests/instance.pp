# @summary This class manages the dnsdist instance
#
#
class dnsdist::instance (
  String $address = '127.0.0.1:53',
  Optional[Array[String]] $additional_addresses,
){

  $order = '10-instance';

  # Template uses $address, $cluster_name
  concat::fragment { 'dnsdist_instance':
    order   => $order,
    target  => $dnsdist::params::config_file,
    content => template('dnsdist/dnsdist_instance.erb'),
  }
}