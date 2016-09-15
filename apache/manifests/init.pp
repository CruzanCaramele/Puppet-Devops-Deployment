# == Class: apache
# === Authors
#
# Hamza Yahaya <letters2hamza@gmail.com>
#
# === Copyright
#
# Copyright 2016 Hamza Yahaya
#
class apache (

	$package_name = $apache::params::package_name,
	$service_name = $apache::params::service_name

	) inherits apache::params {

	include apache::service
	include apache::package

	exec { 'enable-epel':
		command      => 'yum-config-manager --enable epel',
		path         => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
		require      => Package["epel-release"],
		#unless      => 'test param-that-would-be-true',\
	} ->

	exec { 'add-el7-repo':
		command      => 'curl --fail -sSLo /etc/yum.repos.d/passenger.repo https://oss-binaries.phusionpassenger.com/yum/definitions/el-passenger.repo',
		path         => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
		require      => [Package['yum-utils'],Package[$apache::package::pre_requisites]],
		before       => Package['apache'],
		#unless      => 'test param-that-would-be-true',
	}
}
