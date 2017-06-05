class profile::docker::gosu(
  $gosu_version = '1.10',
) {
  class { '::gosu':
    gosu_version => $gosu_version
  }
}
