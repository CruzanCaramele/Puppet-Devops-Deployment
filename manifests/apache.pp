node default {
	include apache

	# Class: collectd
	#
	#
	class collectd {
		# resources
		signalfx_api_token => '',
	} ->
}