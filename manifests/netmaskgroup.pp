# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
define dnsdist::netmaskgroup(
  Array[String] $addresses
){

  include ::dnsdist::params

  $order = "55-netmaskgroup-${title}"

  # Template uses $address, $cluster_name
  concat::fragment { "netmaskgroup_${title}":
    order   => $order,
    target  => $dnsdist::params::config_file,
    content => template('dnsdist/dnsdist_netmaskgroup.erb'),
  }
}
