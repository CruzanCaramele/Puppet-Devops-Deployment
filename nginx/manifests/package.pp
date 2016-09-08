# Class: nginx::package
#
#
class nginx::package (

	$package_name         = $nginx::params::package_name,
	$passenger_package    = $nginx::params::passenger_package,
	$epel_release_package = $nginx::params::epel_release_package,
	$yum_utils_package    = $nginx::params::yum_package

	){

	$pre_requisites = ['pygpgme', 'curl', 'git']

	# resources
	package { 'epel-release':
		name   => $epel_release_package,
		ensure => installed,
		before => [Package['nginx'], Package['yum-utils'],Package[$pre_requisites]],
	}

	package { 'yum-utils':
		name   => $yum_utils_package,
		ensure => installed,
		before => [Package['nginx'], Package[$pre_requisites]],
	}

	package { $pre_requisites:
		ensure  => installed,
		require => Package['epel-release'],
		before  => Package['nginx'],
	}

	package { 'nginx':
	    name   => $package_name,
		ensure => installed,
	}

	package { 'passenger':
		name    => $passenger_package,
		ensure  => installed,
		require => Package['nginx'],
	}
}