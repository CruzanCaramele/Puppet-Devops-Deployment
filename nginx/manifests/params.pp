# Class: ngixn::params
#
#
class nginx::params {

	if ($::fqdn) {
		$servername = $::fqdn
	} else {
			$servername = $::hostname
	}
	

	# resources
	$package_name           = "nginx"
	$service_name           = "nginx"
	$app_root_www           = "/var/www/myapp/code"
	$error_log_dir          = "/var/log/nginx"
	$access_log_dir         = "/var/log/nginx"
	$vhost_config_dir       = "/etc/nginx/conf.d"
	$passenger_package      = "passenger"
	$yum_utils_package      = "yum-utils"
	$nginx_config_dir       = "/etc/nginx"
	$passenger_config_dir   = "/etc/nginx/conf.d"
	$epel_release_package   = "epel-release"
}