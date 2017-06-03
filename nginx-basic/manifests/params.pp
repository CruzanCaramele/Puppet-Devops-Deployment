# parameters
#
class nginx::params {
	# config parameters
	$ensure          = 'present'
	$docroot         = '/usr/share/nginx'
	$config_dir      = '/etc/nginx'
	$config_mode     = '0664'
	$config_group    = 'root'
	$config_owner    = 'root'
	$package_name    = 'nginx'
	$config_confd    = "${config_dir}/conf.d"
	$config_ensure   = 'file'
	$config_log_dir  = '/var/log/nginx'
	$config_pid_file = '/run/nginx.pid'

	# selectors

	$config_vdir_enable = $facts['os']['family'] ? {
		'Debian' => $config_dir,
		default  => undef,
	}

	$config_process_user = $facts['os']['family'] ? {
		'Debian' => 'www-data',
		default  => 'nginx',
	}

	$vhost_dir = $facts['os']['family'] ? {
		'Debian' => "${config_dir}/sites-enabled",
		default  => ${config_confd},
	}

	# service parameters
	$service_name       = 'nginx'
	$service_enable     = 'true'
	$service_ensure     = 'running'
	$service_pattern    = 'nginx'
	$service_hasstatus  = 'true'
	$service_hasrestart = 'true'


}