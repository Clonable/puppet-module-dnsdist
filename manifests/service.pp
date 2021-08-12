# @summary This class manages the dnsdist service
#
#
# @api private
#
class dnsdist::service {

  if $dnsdist::service_manage {
    service { 'dnsdist':
      ensure => $dnsdist::service_ensure,
      enable => $dnsdist::service_enable
    }
  }
}
