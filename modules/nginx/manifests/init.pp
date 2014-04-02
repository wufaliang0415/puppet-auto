/**
  *type = default|public|private........
  *
  */
class nginx (
	$type = 'public',
	$vhost = 'bbs,zhuti,lewaos,theme',
	$proxy = 'api_center,op',
	$ssl = 'api,bi',
) {
	include nginx::install, nginx::config, nginx::service
}
