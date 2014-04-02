class php::config {
	file { 'config_file' :
		ensure => present,
		path => $php::param::config_file,
		source => "puppet:///extra_files/${client_host}/php/${php::type}-php.ini",
		owner => 'root',
		group => 'root',
		replace => false,
		mode => 0644,
		require => Class['php::install'],
		notify => Class['php::service']
	}
	file { 'php_fpm_conf' :
		ensure => present,
		path => $php::param::php_fpm_conf,
		source => "puppet:///extra_files/${client_host}/php/${php::type}-php-fpm.conf",
		owner => 'root',
		group => 'root',
		replace => false,
		require => Class['php::install'],
		notify => Class['php::service'],
		mode => 0644
	}
	file { "php_fpm_dir" :
               ensure => directory,
               path => "/etc/php-fpm.d",
               owner => 'root',
               group => 'root',
               mode => 0750
        }
#	file {"/web" :
#		ensure => directory,
#		owner => 'root',
#		group => 'root',
#		mode => 0755
#	}
}
