node default {
	# Class: 	#
	#
	class {'collectd':
		# resources
		signalfx_api_token => 'token',
	}
}