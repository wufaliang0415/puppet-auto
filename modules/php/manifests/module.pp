define php::module (
	$version = undef,
	$module_prefix = 'php',
) {
	$fullname = "${module_prefix}-${name}"
	package { "PhpModule_${fullname}" :
		ensure => present,
		name => $fullname,
		notify => Class["php::service"],
		require => Class["php::install"]
	}
#	package { "PhpModule_${fullname}" :
#		ensure => 'absent',
#		name => $fullname,
#	}
}
