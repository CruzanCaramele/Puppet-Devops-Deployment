# Class: nodejs::package
#
#
class nodejs::package (

	$package_name         = $nodejs::params::package_name

	) {
	# variables
	$requirements = ['gcc-c++', 'make']
	$epel_curl    = ['epel-release', 'curl']

	package { $epel_curl:
		ensure => installed,
		before => [Package['nodejs'], Package[$requirements]],
	}

	package { 'nodejs':
		name   => $package_name,
		ensure => installed,
		before => Package[$requirements],
	}

	package { $requirements:
		ensure => installed,
	}
}