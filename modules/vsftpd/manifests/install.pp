class vsftpd::install {
	package { 'vsftpd' :
		ensure => present
	}
	package { ['db4', 'db4-devel', 'db4-cxx', 'db4-utils'] :
		ensure => installed
	}
	file { 'ftp' :
		path => "${vsftpd::ftp_dir}",
		ensure => directory,
		owner => 'virtual',
		group => 'web',
		mode => 755,
		require => User['virtual']
	}
	user { 'virtual' :
                ensure => present,
                uid => 6001,
                gid => 'web',
                shell => '/sbin/nologin',
                managehome => true,
		home => "${vsftpd::ftp_dir}",
		require => Group['web']
        }
}
