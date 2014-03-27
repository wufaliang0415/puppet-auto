class php::param {
	$config_file = $::operatingsystem ? {
		/(?i:Ubuntu|Debian|Mint)/ => '/etc/php5/php.ini',
	    	default => '/etc/php.ini',
	}
	$config_dir = $::operatingsystem ? {
		/(?i:Ubuntu|Debian|Mint)/ => '/etc/php5',
	        default                   => '/etc/php.d',
	}
	$version = undef
	$php_fpm_conf = '/etc/php-fpm.conf'
}
