# == Class: nginx
# Author Name <Hamza Yahaya>
#
# === Copyright
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class nginx(

	String $ensure                       = $::nginx::params::ensure
	String $config_dir                   = $::nginx::params::config_dir
	String $config_mode                  = $::nginx::params::config_mode
	String $config_group                 = $::nginx::params::config_group
	String $config_owner                 = $::nginx::params::config_owner
	String $package_name                 = $::nginx::params::package_name
	String $config_confd                 = $::nginx::params::config_confd
	String $config_ensure                = $::nginx::params::config_ensure
	String $config_log_dir               = $::nginx::params::config_log_dir
	String $config_pid_file              = $::nginx::params::config_pid_file
	Optional[String] $config_vdir_enable = $::nginx::params::config_vdir_enable

	) inherits ::nginx::params {
}
