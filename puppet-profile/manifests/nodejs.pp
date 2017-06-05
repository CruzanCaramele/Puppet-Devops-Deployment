class profile::nodejs(
  $node_group,
  $node_user
) {
  group { $node_group:
    ensure => present,
  }

  user { $node_user:
    ensure => present,
    shell  => '/bin/false',
    gid    => $node_group,
  }

  limits::entry { 'ulimits-nofile':
    domain => "*",
    type   => '-',
    item   => 'nofile',
    value  => '500000',
    require => User[$node_user],
  }
}
