class dnsdist (
  Boolean $package_manage = true,
  String $package_ensure = 'present',
  Boolean $service_manage = true,
  Boolean $service_enable = true,
  Enum['running', 'stopped'] $service_ensure = 'running',
  String $version = $dnsdist::params::version
  ) inherits dnsdist::params {

  contain dnsdist::install
  contain dnsdist::config
  contain dnsdist::service

  Class['::dnsdist::install']
    -> Class['::dnsdist::config']
    ~> Class['::dnsdist::service']
}
