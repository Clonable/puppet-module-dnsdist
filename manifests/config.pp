# @summary 
#       This class handles the configuration of dnsdist.
#
# @api private
class dnsdist::config {

  include ::dnsdist::params

  concat { $dnsdist::params::config_file:
    ensure => present,
    group  => '_dnsdist',
    mode   => '0640',
    owner  => 'root',
    notify => Service['dnsdist'],
  }
}
