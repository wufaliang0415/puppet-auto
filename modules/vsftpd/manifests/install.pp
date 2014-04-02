class vsftpd::install {
	package { 'vsftpd' :
		ensure => present
	}
	package { ['db4', 'db4-devel', 'db4-cxx', 'db4-utils'] :
		ensure => installed
	}
	file { 'ftp' :
		path => $vsftpd::ftp_dir,
		ensure => directory,
		owner => $vsftpd::ftp_user,
		group => 'web',
		mode => 755,
		require => User['virtual']
	}
	user { 'virtual' :
		name => $vsftpd::ftp_user,
                ensure => present,
                uid => $vsftpd::ftp_uid,
                gid => 'web',
		groups => ['wheel','web'],
		home => $vsftpd::ftp_dir,
		require => Group['web']
        }
	#ftp服务器必须关系selinux
        file { '/etc/selinux/config' : ensure => present}
        exec { 'close selinux' :
                command => "/usr/sbin/setenforce 0",
                subscribe => File['/etc/selinux/config'],
                refreshonly => true
        }
}
