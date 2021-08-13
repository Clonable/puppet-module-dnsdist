# @summary Manages the dnsdist package
#
#
# @api private
class dnsdist::install {

  # install dnsdist package
  if $dnsdist::package_manage {
    apt::pin { 'dnsdist':
      origin   => 'repo.powerdns.com',
      priority => '100',
    }

    apt::source { 'repo.powerdns.com':
      location     => 'http://repo.powerdns.com/ubuntu',
      repos        => 'main',
      release      => join([$::lsbdistcodename, '-dnsdist-', $dnsdist::version], ''),
      architecture => 'amd64',
      key          => {
        id     => '9FAAA5577E8FCF62093D036C1B0C6205FD380FBB',
        server => 'keyserver.ubuntu.com',
      },
      require      => Apt::Pin['dnsdist'];
    }


    package {'dnsdist':
      ensure  => $dnsdist::package_ensure,
      require => Apt::Source['repo.powerdns.com'],
    }
  }
}
