# parameters
#
class nginx::params {
	# parameters
	$ensure        = 'present'
	$config_dir    = '/etc/nginx'
	$config_mode   = '0664'
	$config_group  = 'root'
	$config_owner  = 'root'
	$package_name  = 'nginx'
	$config_confd  = "${config_dir}/conf.d"
	$config_ensure = 'file'
}