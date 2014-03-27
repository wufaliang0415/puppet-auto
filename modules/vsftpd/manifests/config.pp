class vsftpd::config (
        $anon_world_readable_only = 'NO',
        $anon_upload_enable = 'YES',
        $write_enable = 'YES',
        $download_enable = 'YES',
        $anon_other_write_enable = 'YES',
        $anon_mkdir_write_enable = 'YES',
        $local_root = 'YES',
) {
	FILE {
		owner => 'root',
		group => 'root',
		require => Class['vsftpd::install'],
                notify  => Class['vsftpd::service'],
	}
  	file { '/etc/vsftpd/vsftpd.conf':
	   	ensure => present,
	    	replace => true,
		mode => 0600,
	    	content => template('vsftpd/vsftpd.conf.erb'),
  	}
	$users = $vsftpd::ftp_users
	#foreache user
        $vsftpd::ftp_users.foreach {|$ftp_user|
		if $ftp_user['anon_world_readable_onlys'] != '' {
			$anon_world_readable_only = $ftp_user['anon_world_readable_only']
		}
		if $ftp_user['anon_upload_enable'] != '' {
                	$anon_upload_enable = $ftp_user['anon_upload_enable']
		}
		if $ftp_user['write_enable'] != '' {
                	$write_enable = $ftp_user['write_enable']
		}
		if $ftp_user['download_enable'] != '' {
                	$download_enable = $ftp_user['download_enable']
		}
		if $ftp_user['anon_other_write_enable'] != '' {
                	$anon_other_write_enable = $ftp_user['anon_other_write_enable']
		}
		if $ftp_user['anon_mkdir_write_enable'] != '' {
                	$anon_mkdir_write_enable = $ftp_user['anon_mkdir_write_enable']
		}
		if $ftp_user['local_root'] != '' {
                	$local_root = $ftp_user['local_root']
		}
	#	$anon_world_readable_only = $ftp_user['anon_world_readable_only']
	#	$anon_upload_enable = $ftp_user['anon_upload_enable']
	#	$write_enable = $ftp_user['write_enable']
	#	$download_enable = $ftp_user['download_enable']
	#	$anon_other_write_enable = $ftp_user['anon_other_write_enable']
	#	$anon_mkdir_write_enable = $ftp_user['anon_mkdir_write_enable']
	#	$local_root = $ftp_user['local_root']
                file { "/etc/vsftpd/vu_conf/${ftp_user['username']}" :
                        ensure => present,
                        mode => 0644,
                        content => template('vsftpd/virtual.erb')
                }
        }
	file { 'user_list' :
		path => '/etc/vsftpd/user_list',
		ensure => present,
		replace => true,
		mode => 0600,
		content => template('vsftpd/user_list.erb')
	}
	file { 'vu_conf' :
		path => '/etc/vsftpd/vu_conf',
		ensure => directory,
		mode => 0644
	}
	file { 'vsftpd.vu' :
		path => '/etc/pam.d/vsftpd.vu',
		ensure => present,
		replace => false,
		mode => 0644,
		source => "puppet:///modules/vsftpd/pam.d/vsftpd.vu"
	}
	file { 'chroot_list' :
		path => '/etc/vsftpd/chroot_list',
		ensure => present,
		replace => true,
		mode => 0644,
		content => template('vsftpd/chroot_list.erb'),
	}
}
