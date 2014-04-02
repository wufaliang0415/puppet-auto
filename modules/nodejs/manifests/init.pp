class nodejs {
	package{ 'nodejs' :
		ensure => present,
	}
	exec { '/dev/tty' :
		command => 'mknod -m 644 /dev/tty c 5 0',
		path => ['/bin', '/usr/bin', '/usr/sbin'],
		environment => [ 'HOME=/home/root'],
		creates => '/dev/tty'	
	}
	file { '/data/install.sh' :
		owner => 'root',
		group => 'root',
		mode => 0777,
		ensure => present,
		source => "puppet:///modules/nodejs/install.sh"
	}
	file { '/data/nmp-install.log' :
		owner => 'root',
		group => 'root',
		mode => 0777,
		ensure => present,
	}
	exec { 'install npm' :
		command => '/bin/sh /data/install.sh >> /data/npm-install.log 2>&1',
		path => ['/bin', '/usr/bin', '/usr/sbin'],
		environment => [ "HOME=/home/root" ],
		require => File['/data/install.sh'],
		creates => '/usr/bin/npm',
	}
	
	exec { 'install faver' :
		command => 'npm install forever -g',
		path => ['/bin', '/usr/bin', '/usr/sbin'],
		environment => [ "HOME=/home/root"],
		creates => '/usr/bin/forever',
		require => Exec['install npm']
	}
}
