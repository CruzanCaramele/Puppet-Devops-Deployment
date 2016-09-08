# Define: nginx::vhost
#
# arguments
#
define nginx::vhost (

	$app_root_www, $nginx_config_dir, $error_log_dir, $access_log_dir, $vhost_config_dir, $passenger_config_dir

	) {
	# puppet code

	file { ['/var/www',
			'/var/www/myapp',
			'/var/www/myapp/code']:
		ensure => directory,
		before => File['/var/www/myapp/code/index-html'],
	}

	file { '/var/www/myapp/code/index-html':
		ensure => file,
		source => 'puppet:///modules/nginx/index.html',
		before => File['nginx-conf']
	}

	file { 'nginx-conf':
		ensure => file,
		path   => "${nginx_config_dir}/nginx.conf",
		source => 'puppet:///modules/nginx/nginx.conf',
		before => [File['passenger-conf'], File['app-conf']],
	}

	file { 'passenger-conf':
		ensure  => file,
		path    => "${passenger_config_dir}/passenger.conf",
		source  => 'puppet:///modules/nginx/passenger.conf',
		before  => File['app-conf'],
	}

	file { 'app-conf':
		ensure  => file,
		path    => "${vhost_config_dir}/app.conf",
		source  => 'puppet:///modules/nginx/app.conf',
	}

	vcsrepo {$app_root_www
		ensure   => present,
		provider => git,
		source   => 'https://github.com/phusion/passenger-nodejs-connect-demo.git',

	}
}