class ssh (
	$passwordAuthentication = 'no',
	$permitRootLogin = 'no',
){
	include ssh::params, ssh::install, ssh::config, ssh::service
}
