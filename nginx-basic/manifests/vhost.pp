# Define: nginx::vhost
#
define nginx::vhost (
	Integer $port 						 = 80,
	Boolean $enable 					 = true,
	String  $priority					 = '50', 
	String  $config_mode				 = $::nginx::config_mode,
	String  $config_group				 = $::nginx::config_group,
	String  $config_owner				 = $::nginx::config_owner,
	String  $server_aliases				 = 
	String  $config_log_dir				 = $::nginx::config_log_dir,				 
	String  $config_vhost_dir            = $::nginx::config_vhost_dir,
	Optional[String] $config_vdir_enable = $::nginx::config_vdir_enable,

	) {
	# resources
	file { "${config_vhost_dir}/${priority}--${name}.conf":
		mode    => $config_mode,
		owner   => $config_owner,
		group   => $config_group,
		notify  => Service['nginx_service'],
		ensure  => file,
		content => template("${module_name}/vhost/vhost.conf.erb"),
	}
}