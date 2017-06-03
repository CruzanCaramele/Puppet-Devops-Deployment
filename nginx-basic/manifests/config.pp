 # Class: nginx::config
#
#
class nginx::config(

	String $docroot						 = $::nginx::docroot,
	String $config_dir                   = $::nginx::config_dir,
	String $config_mode                  = $::nginx::config_mode,
	String $config_group                 = $::nginx::config_group,
	String $config_owner                 = $::nginx::config_owner,
	String $config_confd                 = $::nginx::config_confd,
	String $config_ensure                = $::nginx::config_ensure,
	String $config_log_dir               = $::nginx::config_log_dir,
	String $config_pid_file              = $::nginx::config_pid_file,
	String $config_process_user          = $::nginx::config_process_user,
	Optional[String] $config_vdir_enable = $::nginx::config_vdir_enable,	

	) {
	# resources
	file { 'nginx_config_file':
		path    => "${config_dir}/nginx.conf",
		mode    => $config_mode,
		owner   => $config_owner,
		group   => $config_group,
		ensure  => $config_ensure,
		content => template("${module_name}/conf.d/nginx.conf.erb"),
	}

	file { $config_log_dir:
		ensure  => directory,
		recurse => true,
	}

	file { $docroot:
		mode    => $config_mode,
		owner   => $config_owner,
		group   => $config_group,
		ensure  => directory,
		recurse => true,
	}
}