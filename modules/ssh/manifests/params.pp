class ssh::params {
	case $operatingsystem {
		'Solaris' : {
			$ssh_package_name = 'openssh'
		}
		/(Ubuntu|Debian)/ : {
			$ssh_package_name = 'openssh-server'
		}
		/(ReHat|CentOS|Fedora)/ : {
			$ssh_package_name = 'openssh-server'
		}
		default : {
			$ssh_package_name = 'ssh'
		}
	}
}
