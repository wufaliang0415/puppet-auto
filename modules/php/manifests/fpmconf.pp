define php::fpmconf (
	$pm = 'dynamic',
	$max_children = 100,
        $start_servers = 10,
        $min_spare_servers = 5,
        $max_spare_servers = 15,
	$group = 'web',
	$projects = ''
) {
	if $projects == '' {
		notify { "paramter \$projects is empty, please check it" :}
	} else {
		$projects_array = split($projects, ',')
		$projects_array.foreach{|$project|
			$project_info = split($project, ':')
			$project_name = $project_info[0]
			$project_port = $project_info[1]
			$project_user = "web_${project_name}"
			
			user { "${project_user}" :
                                uid => $project_port,
                                gid => 'web',
                                shell => '/sbin/nologin',
                                home => "/web/${project_name}",
                        }
                        file { "/web/${project_name}" :
                                ensure => directory,
                                owner => $project_user,
                                group => 'web',
                                mode => 0755,

                        }
                        file { ["/web/${project_name}/htdoc", "/web/${project_name}/log", "/web/${project_name}/data", "/web/${project_name}/shell", "/web/${project_name}/config"] :
                                ensure => directory,
                                owner => $project_user,
                                group => 'web',
                                mode => 0755,
                        }
                        file { "/web/${project_name}/log/php-slow.log" :
                                ensure => present,
                                owner => $project_user,
                                group => 'web',
                                replace => false,
                                mode => 0644
                        }
                        file { "/web/${project_name}/config/php-fpm.conf" :
                                ensure => present,
                                content => template('php/pool.erb'),
                                owner => $project_user,
                                group => 'web',
                                mode => 0640,
                                replace => true,
                                notify => Class['php::service'],
                                require => Class['php::install']
                        }
			file { "/etc/php-fpm.d/${project_name}.conf" :
				ensure => 'link',
				target => "/web/${project_name}/config/php-fpm.conf",
				mode => '0777'
			}
		}
	}	
}
