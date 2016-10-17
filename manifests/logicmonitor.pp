# Class: 
#
#
class  {'logicmonitor'
	# resources
	account    => 'puppetuser',
	access_id  => 'super_secret_id',
	access_Key => 'super_secret_key',
}