class rsync ($environment = "tool", $conf_name = "rsyncd.conf") {
	package { 'rsync' :
		ensure => installed,
	}
	include rsync::config
} 
