class github {
  require known_hosts
  require ssh_keys

  package { "git":
    ensure => latest
  }

  vcsrepo { "/var/sources":
    ensure   => present,
    provider => git,
    revision => "master",
    source   => "git@github.com:Automattic/wp-calypso.git",
    owner    => "vagrant",
    group    => "vagrant",
    require  => Package["git"]
  }
}