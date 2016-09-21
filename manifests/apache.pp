node default {
	include apache

	# Class: collectd
	#
	#
	class collectd {
		# resources
		signalfx_api_token => '',
	} ->

	# Class: 	#
	#
	class { 'collectd::plugins::apache':
		# resources
		instances => {
			$::hostname => {
				'URL' => 'http://localhost/mod_status?auto',
			}
		}
	}
}