# Class: apache::params
#
#
class apache::params {

	if ($::fqdn) {
		$servername = $::fqdn
	} else {
		$servername = $::hostname
	}

	# resources
	$package_name         = "mod_wsgi"
	$service_name         = "httpd"
	$config_dir           = "/etc/http/conf"
	$app_directory        = "/var/www/myapp"
	$app_config_dir       = "/etc/httpd/conf.d"
	$wsgi_config_dir      = "/var/www/myapp"
	$apache_config_dir    = "/etc/httpd/conf"
	$yum_utils_package    = "yum-utils"
	$epel_release_package = "epel-release"
}