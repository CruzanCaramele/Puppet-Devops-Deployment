# Class: nginx::service
#
#
class nginx::service(

	String  $service_name		= $::nginx::service_name,
	Boolean $service_enable  	= $::nginx::service_enable,	
	String  $service_ensure		= $::nginx::service_ensure,
	String  $service_pattern	= $::nginx::service_pattern,
	Boolean $service_hasstatus	= $::nginx::service_hasstatus,
	Boolean $service_hasrestart	= $::nginx::service_hasrestart,	

	) {
	# resources
	service { 'nginx_service':
		name        => $service_name,
		ensure      => $service_ensure,
		enable      => $service_enable,
		pattern     => $service_pattern,
		hasstatus   => $service_hasstatus
		hasrestart  => $service_hasrestart,
		#require    => Class["config"],
	}
}