$client_host = 'lewa'
node 'lewa-console-1' {
        class { 'user' :  my_user => 'lyhuang_wheel_3001:yychen_wheel_3002:whchen_wheel_3003:flwu_wheel_3004:qyzhang_wheel_3005:xfsong_wheel_3006:cztao_wheel_3007'}
        include common
	#install php
        class { 'php' :
                type => 'public'
        }
	package { ['uuid', 'uuid-php', 'uuid-devel']:
                ensure => present,
        }
        php::module {['pecl-apc', 'pear', 'cli', 'pdo', 'pgsql', 'pecl-memcache', 'gd', 'mbstring', 'mcrypt', 'xml', 'mysqlnd', 'pecl-http', 'suhosin'] :}
        php::fpmconf { 'create_project' :
                projects => 'bbs:5003,yunwa:5007'
        }
	#install nginx 
	class {'nginx' :
		type => 'public',
		vhost => 'bbs,yunwa',
		proxy => 'api_center,op,bi,static',
		ssl => 'api_center,bi'
	}
	#install memcache
	include memcached
	#install redis
	class {'redis' :
		bind => '10.0.0.39' 
	}
	#install mysql	
	class {'rework_mysql' :
		environment => 'server'	
	}
	class { 'vsftpd':
		ftp_dir => '/data/yun',
		ftp_user => 'yun',
		ftp_uid => '10005'
	}
	include nodejs
}
node 'lewa-public-1' {
	# manager user create
	user_install{'create_user' : my_user => 'lyhuang_wheel_3001:yychen_wheel_3002:whchen_wheel_3003:flwu_wheel_3004:qyzhang_wheel_3005:xfsong_wheel_3006:cztao_wheel_3007';}
	include common
	#install php
	class { 'php' :
		type => 'public'
	}
	php::module {['pecl-apc', 'pear', 'cli', 'pdo', 'pgsql', 'pecl-memcache', 'pecl-memcached', 'gd', 'mbstring', 'mcrypt', 'xml'] :}
	php::fpmconf { 'create_project' :
		projects => 'bbs:5003,yunwa:5007'
	}
}
