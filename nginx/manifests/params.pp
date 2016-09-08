# Class: ngixn::params
#
#
class nginx::params {
	# resources
	$package_name           = "nginx"
	$service_name           = "nginx"
	$app_root_www           = "/var/www/myapp/"
	$error_log_dir          = "/var/log/nginx"
	$access_log_dir         = "/var/log/nginx"
	$vhost_config_dir       = "/etc/nginx/conf.d"
	$passenger_package      = "passenger"
	$yum_utils_package      = "yum-utils"
	$nginx_config_dir       = "/etc/nginx"
	$passenger_config_dir   = "/etc/nginx/conf.d"
	$epel_release_package   = "epel-release"
}