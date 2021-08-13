# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include dnsdist::server
define dnsdist::server (
  String $cluster_name,
  String $address,
  Optional[String] $source = undef,
  Optional[Integer] $qps = undef,
  Optional[Integer] $weight = undef,
  Optional[String] $pool = undef,
  Optional[Hash] $extra_options = undef,
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
