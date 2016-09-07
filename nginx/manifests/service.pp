# Class: nginx::service
#
#
class nginx::service (

	$service_name = $nginx::params::service_name

	) {

	# resources
	service { 'nginx':
		name        => $service_name,
		enable      => true,
		ensure      => running,
		require     => Package['nginx'],
	}
}