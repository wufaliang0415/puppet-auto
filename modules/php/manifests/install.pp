class php::install {
	package { 'php' :
		ensure => present	
	}
	package { 'php-fpm' :
		ensure => present,
	}
}
