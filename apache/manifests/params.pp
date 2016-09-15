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
	$package_name         = "mod_passenger"
	$service_name         = "httpd"
	$yum_utils_package    = "yum-utils"
	$epel_release_package = "epel-release"
}