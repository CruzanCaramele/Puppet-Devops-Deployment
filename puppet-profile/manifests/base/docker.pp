class profile::base::docker(
  $ntp_servers = [
    '0.ubuntu.pool.ntp.org',
    '1.ubuntu.pool.ntp.org',
  ],
) {
  class { '::ntp':
    servers => $ntp_servers,
  }
}
