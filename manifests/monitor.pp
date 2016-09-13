node default {
	# Class: 	#
	#
	class {'collectd':
		# resources
		signalfx_api_token => '',
	} ->

	class { 'collectd::plugins::nginx':
		config  => {
			'URL' => '"http://localhost:80/nginx_status"',
		}
	} 
}