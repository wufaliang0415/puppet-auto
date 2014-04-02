import 'common.pp'
$hostname_info = split($hostname, '_')
case $hostname_info[0] {
	'lewa' : {
		import 'nodes/lewa_nodes.pp'
	}
	'hello' : {
		$client_host = 'hello'
	}
}
