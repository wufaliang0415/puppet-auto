define nginx::module (
	$version = undef,
	$module_prefix = 'nginx',
) {
	$fullname = "${module_prefix}-${name}"
	package { "NginxModule_${fullname}" :
		ensure => present,
		name => $fullname,
		notify => Class["nginx::service"],
		require => Class["nginx::install"]
	}
}
