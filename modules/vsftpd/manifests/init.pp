class vsftpd (
	$ftp_dir = '/data/ftp',
	$ftp_user = 'virtual',
	$ftp_uid = '6001'
) {
	include vsftpd::install, vsftpd::config, vsftpd::service
}
