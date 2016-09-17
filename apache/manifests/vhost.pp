# Define: apache::vhost
# Parameters:
# arguments
#
define apache::vhost (

	$app_directory, $app_config_dir,$wsgi_config_dir

	) {
	# puppet code

	file { ['/var/www',
	        '/var/www/myapp']:
		ensure  => directory,
		require => Package['apache'],
	} ->

	file { 'app-conf':
		ensure  => file,
		path    => "${$app_config_dir}/app.conf",
		content => template('apache/app.conf.erb'),
	} -> 

	vcsrepo {$app_directory:
		ensure   => present,
		provider => git,
		revision => master,
		force    => true,
		require  => Package['apache'],
		notify   => Service['apache'],
		source   => 'https://github.com/CruzanCaramele/Portfolio.git',
	} ->

		file { 'wsgi-file':
		ensure => file,
		path   => "${wsgi_config_dir}/mod_wsgi.wsgi",
		source => 'puppet:///modules/apache/mod_wsgi.wsgi',
	}
}