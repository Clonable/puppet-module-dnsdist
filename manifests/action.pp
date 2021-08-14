# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
define dnsdist::action (
  String $rule,
  String $action,
){
  include ::dnsdist::params

  $order = "60-action-${title}"

  # Template uses $address, $cluster_name
  concat::fragment { "action_${title}":
    order   => $order,
    target  => $dnsdist::params::config_file,
    content => template('dnsdist/dnsdist_action.erb'),
  }
}
