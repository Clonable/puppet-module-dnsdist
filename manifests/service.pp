# @summary This class manages the dnsdist service
#
#
# @api private
#
define dnsdist::service {

  if $dnsdist::service_manage {
    service { 'dnsdist':
      ensure => $dnsdist::service_ensure,
      enable => $dnsdist::service_enable
    }
  }
}
