# Class: apache::package
#
#
class apache::package (

	$package_name         = $apache::params::package_name,
	$yum_utils_package    = $apache::params::yum_utils_package,
	$epel_release_package = $apache::params::epel_release_package,

	) {

	$pre_requisites = ['pygpgme', 'git', 'curl']
	# resources

	package { 'epel-release':
		name   => $epel_release_package,
		ensure => installed,
		before => [Package["apache"], Package["yum-utils"]],
	}

	package { 'yum-utils':
		name   => $yum_utils_package,
		ensure => installed,
		before => Package["apache"],
	} ->

	package { $pre_requisites:
		ensure => installed,
		before => Package["apache"],
	}

	package { 'apache':
		name   => $package_name,
		ensure => installed,
	}
}