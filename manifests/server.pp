# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include dnsdist::server
define dnsdist::server (
  String $cluster_name,
  String $address,
  Optional[String] $source,
  Optional[Integer] $qps,
  Optional[Integer] $weight,
  Optional[String] $pool,
  Optional[Hash] $extra_options,
){

  include ::dnsdist::params

  $order = "50-${cluster_name}-01-${address}"

  # Template uses $address, $cluster_name
  concat::fragment { "${cluster_name}_server_${name}":
    order   => $order,
    target  => $dnsdist::params::config_file,
    content => template('dnsdist/dnsdist_server.erb'),
  }
}
