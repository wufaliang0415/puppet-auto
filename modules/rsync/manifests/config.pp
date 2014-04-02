class rsync::config {
	case $rsync::environment {
		'server' : {
			file { "/etc/rsyncd.conf" :
                	        ensure => present,
                        	source => "puppet:///extra_files/${client_host}/rsync/${rsync::conf_name}",
                        	owner => 'root',
                        	group => 'root',
                        	mode => 0644
                	}
                	file { "/etc/rsync.pass" :
                        	ensure => present,
                        	source => "puppet:///extra_files/${client_host}/rsync/rsync.pass",
                        	owner => 'root',
                        	group => 'root',
                        	mode => 0600
                	}
		}
		'client' : {
			file { "/etc/rsync.pass" :
                                ensure => present,
                                source => "puppet:///extra_files/${client_host}/rsync/rsync.pass",
                                owner => 'root',
                                group => 'root',
                                mode => 0600
                        }
		}
		'tool' : {
			# no action
		}
	}
}
