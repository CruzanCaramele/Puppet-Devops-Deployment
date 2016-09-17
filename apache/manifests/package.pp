# Class: apache::package
#
#
class apache::package (

	$package_name         = $apache::params::package_name,
	$yum_utils_package    = $apache::params::yum_utils_package,
	$epel_release_package = $apache::params::epel_release_package,

	) {

	$pip_install   = ['flask']
	$pre_requisites = ['pygpgme','curl', 'python', 'python-pip']
	# resources

	package { 'epel-release':
		name   => $epel_release_package,
		ensure => installed,
	} ->

	package { 'yum-utils':
		name   => $yum_utils_package,
		ensure => installed,
		before => Package["apache"],
	} ->

	package { 'git':
		ensure => present,
	} ->

	package { $pre_requisites:
		ensure => installed,
	} ->

	package { $pip_install:
		ensure   => installed,
		provider => pip,
	} ->

	package { 'apache':
		name   => $package_name,
		ensure => installed,
	}
}