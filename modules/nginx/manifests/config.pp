class nginx::config {

	FILE {
		owner => 'root',
		group => 'root',
		require => Class["nginx::install"],
                notify => Class["nginx::service"],
	}
	
	file { '/etc/nginx/conf.d' :
                ensure => directory,
                mode => 0755
        }
	file { '/etc/nginx/conf.d/ssl' :
                ensure => directory,
                mode => 0755
        }

	file { '/etc/nginx/conf.d/ssl.conf' :
		ensure => present,
		source => "puppet:///extra_files/lewa/nginx/${nginx::type}/conf.d/ssl.conf",
		mode => 0644,
	}
	file {'/etc/nginx/conf.d/virtual.conf' :
		ensure => present,
		source => "puppet:///extra_files/lewa/nginx/${nginx::type}/conf.d/virtual.conf",
		mode => 0644,
	}
	file { '/etc/nginx/nginx.conf' :
		ensure => present,
		source => "puppet:///extra_files/lewa/nginx/${nginx::type}/nginx.conf",
		mode => 0644,
	}
	file { '/etc/nginx/conf.d/proxy.conf':
		ensure => present,
		source => "puppet:///extra_files/lewa/nginx/${nginx::type}/conf.d/proxy.conf",
		mode => 0644
	}
	file { '/etc/nginx/conf.d/upstream-fair.conf' :
		ensure => present,
		source => "puppet:///extra_files/lewa/nginx/${nginx::type}/conf.d/upstream-fair.conf",
		mode => 0644,
	}
	if $nginx::vhost != '' {
		$vhosts = split($nginx::vhost, ',')
		$vhosts.foreach{|$vhost|
			$web_user = "web_${vhost}"
			file { "/web/${vhost}/config/nginx.conf" :
				ensure => present,
				owner => $web_user,
				group => 'web',
				mode => 0644,
				source => "puppet:///extra_files/lewa/nginx/${nginx::type}/conf.d/${vhost}.conf"
			}
			file { "/etc/nginx/conf.d/${vhost}.conf" :
				ensure => 'link',
				target => "/web/${vhost}/config/nginx.conf",
				mode => 0644,
			}
		}
	}
	if $nginx::proxy != '' {
		$proxys = split($nginx::proxy, ',')
		$proxys.foreach{|$proxy|
			$proxy_name = "proxy_${proxy}"
			file { "/etc/nginx/conf.d/${proxy_name}.conf" :
                                ensure => present,
                                mode => 0644,
                                source => "puppet:///extra_files/lewa/nginx/${nginx::type}/conf.d/${proxy_name}.conf"
                        }
		}
	}
	if  $nginx::ssl != '' {
		$ssls = split($nginx::ssl, ',')
		$ssls.foreach{|$ssl|
			file { "/etc/nginx/conf.d/ssl/${ssl}.key" :
				ensure => present,
				mode => 0644,
				source => "puppet:///extra_files/lewa/nginx/${nginx::type}/conf.d/ssl/${ssl}.key",
				require => FILE['/etc/nginx/conf.d/ssl']
			}
			file { "/etc/nginx/conf.d/ssl/${ssl}.crt" : 
                                ensure => present,
                                mode => 0644,
                                source => "puppet:///extra_files/lewa/nginx/${nginx::type}/conf.d/ssl/${ssl}.crt",
				require => FILE['/etc/nginx/conf.d/ssl']
                        }
		}
	}	
}
