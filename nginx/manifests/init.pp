# Class: nginx
#
#
class nginx (

	$package_name           = $nginx::params::package_name,
	$service_name           = $nginx::params::service_name,
	$app_root_www           = $nginx::params::app_root_www,
	$error_log_dir          = $nginx::params::error_log_dir,
	$access_log_dir         = $nginx::params::access_log_dir,
	$nginx_config_dir       = $nginx::params::nginx_config_dir,
	$vhost_config_dir       = $nginx::params::vhost_config_dir,
	$yum_utils_package      = $nginx::params::yum_utils_package,
	$passenger_config_dir   = $nginx::params::passenger_config_dir,
	$epel_release_package   = $nginx::params::epel_release_package

	) inherits nginx::params {

	include nginx::package 
	include nginx::service
	# resources

	exec { 'enable-epel':
		command      => 'yum-config-manager --enable epel',
		path         => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
		require      => [Package['epel-release'],Package['yum-utils']],
		before       => Exec['add-el7-repo'],
	}

	exec { 'add-el7-repo':
		command      => 'curl --fail -sSLo /etc/yum.repos.d/passenger.repo https://oss-binaries.phusionpassenger.com/yum/definitions/el-passenger.repo',
		path         => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
		require      => [Package['yum-utils'],Package[$nginx::package::pre_requisites]],
		before       => Package['nginx'],
	}

	nginx::vhost {"default":
		app_root_www         => $app_root_www,
		error_log_dir        => $error_log_dir,
		access_log_dir       => $access_log_dir,
		nginx_config_dir     => $nginx_config_dir,
		vhost_config_dir     => $vhost_config_dir,
		passenger_config_dir => $passenger_config_dir,
	}
}