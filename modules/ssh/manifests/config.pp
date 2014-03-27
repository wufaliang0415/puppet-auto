class ssh::config {
	if $ipaddress_eth1 == undef {
		 $ips = ["${ipaddress}:22", "${ipaddress_lo}:22"]
	} else {
		 $ips = ["${ipaddress}:22", "${ipaddress_lo}:22", "${ipaddress_eth1}:60022"]
	}
	File {
		owner => 'root',
		group => 'root',
		mode => 0640
	}
	file { 'ssh_config':
		path => '/etc/ssh/sshd_config',
		ensure => present,
		content => template('ssh/sshd_config.erb'),
		require => Class["ssh::install"],
		notify => Class["ssh::service"]
	}
}
