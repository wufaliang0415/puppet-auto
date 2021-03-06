class sudo {
	package { 'sudo' :
		ensure => present
	}
	if $operatingsystem == "Ubuntu" {
		package { 'sudo-ldap' :
			ensure => present,
			require => Package["sudo"],
		}
	}
	file { "/etc/sudoers" :
		owner => 'root',
		group => 'root',
		mode => 0440,
		source => "puppet:///extra_files/${client_host}/sudo/sudoers",
		require => Package["sudo"],

	}
	file { "/etc/sudoers.d/deploy" :
		owner => 'root',
		group => 'root',
		mode => '0440',
		source => "puppet:///extra_files/${client_host}/sudo/deploy",
		require => Package["sudo"]
	}
	file { "/etc/sudoers.d/puppet" :
		owner => 'root',
		group => 'root',
		mode => '0440',
		source => "puppet:///extra_files/${client_host}/sudo/deploy",
		require => Package['sudo']
	}
}
