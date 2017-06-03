# Class: nginx::install
#
#
class nginx::install(

	String $ensure 		 = $::nginx::ensure,
	String $package_name = $::nginx::package_name,

	) {
	# resources
	package { 'install_nginx':
		name   => $package_name,
		ensure => $ensure,
	}
}