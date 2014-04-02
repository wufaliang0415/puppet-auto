class vsftpd::config {
	
	FILE {
		owner => 'root',
		group => 'root',
		require => Class["vsftpd::install"],
		notify => Class["vsftpd::service"],
	}
	file { '/etc/vsftpd/vsftpd.conf':
		ensure => present,
		source => "puppet:///extra_files/${client_host}/vsftpd/vsftpd.conf",
		mode =>  0600
	}
	file { 'login' :
		path => '/etc/vsftpd/login',
		ensure => file,
		mode => 0644,
		source => "puppet:///extra_files/${client_host}/vsftpd/login"
	}
	file { 'login.db' :
		path => '/etc/vsftpd/login.db',
		ensure => present,
		mode => 0600,
		source => "puppet:///extra_files/${client_host}/vsftpd/login.db"
	}
	file { 'user_list' :
		path => '/etc/vsftpd/user_list',
		ensure => present,
		mode => 0600,
		source => "puppet:///extra_files/${client_host}/vsftpd/user_list"
	}
	file { 'vu_conf' :
		path => '/etc/vsftpd/vu_conf',
		ensure => directory,
		recurse => true,
		source => "puppet:///extra_files/${client_host}/vsftpd/vu_conf",
		mode => 0644
	}
	file { 'vsftpd.vu' :
		path => '/etc/pam.d/vsftpd.vu',
		ensure => present,
		mode => 0644,
		source => "puppet:///extra_files/${client_host}/vsftpd/pam.d/vsftpd.vu"
	}
	file { 'chroot_list' :
		path => '/etc/vsftpd/chroot_list',
		ensure => present,
		mode => 0644,
		source => "puppet:///extra_files/${client_host}/vsftpd/chroot_list"
	}
}
