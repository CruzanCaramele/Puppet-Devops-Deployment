class profile::ghost {
  class { '::nodejs':
    repo_url_suffix => '6.x',
  }

  class { '::ghost': }

  ::ghost::blog { 'ghost':
    use_supervisor => false,
  }

  Ghost::Blog <| |> {
    require => Class['::nodejs']
  }
}
