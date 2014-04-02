define nginx::vhost (
	$ssl = 'false',
	$prefix_domain = 'wufaliang.com'
) {
	$username = "web_${name}"
	$domain = "${name}.${prefix_domain}"
	$port = $name ? {
		'api' => 5001,
		'op' => 5002,
		'www' => 5003,
		default => 9000
	}
	case $port {
		9000: {
			notice ("Unkonw web project ${name}")
		}
		default : {
			file { "/etc/nginx/conf.d/${name}.conf" :
				ensure => present,
				owner => 'root',
				group => 'root',
				mode => 0644,
				replace => true,
				content => template("nginx/vhost.erb"),
			}
		}
	}

}
