# Class: nodejs
#
#
class nodejs (

	$package_name         = $nodejs::params::package_name,
	$epel_release_package = $nodejs::params::package_name

	) inherits nodejs::params {

	# classes
	include nodejs::package

	# resources
	exec { 'nodesource':
		command      => 'curl --fail -sSL -o setup-nodejs https://rpm.nodesource.com/setup_4.x',
		path         => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
		cwd          => '/usr/bin',
		require      => [Package[$nodejs::package::epel_curl], Package[$nodejs::package::epel_curl]],
		before       => [Package['nodejs'], Package[$nodejs::package::requirements], Exec['setup-nodejs']],
	}

	exec { 'setup-nodejs':
		command      => 'bash setup-nodejs',
		path         => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
		cwd          => '/usr/bin',
		before       => Package['nodejs'],
	}
}