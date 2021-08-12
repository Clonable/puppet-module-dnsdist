# @summary Manages the dnsdist package
#
#
# @api private
class dnsdist::install {

  # install dnsdist package
  if $dnsdist::package_manage {
    package {'dnsdist':
      ensure => $dnsdist::package_ensure
    }
  }
}
