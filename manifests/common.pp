/**
 * 1)基本用户组及用户创建。
 * 2)基本目录创建，后续module有依赖。
 * 3)LVM 磁盘分区配置.
 * 4)yum 云安装
 * 5)基本软件安装
 */

class common {
	#添加私有云 并兼容centos 5 ,6系列的版本
	Group <| |> -> User <| |> -> Yumrepo <| |>
	Yumrepo <| |> -> Package <| provider == yum |>
	case $::operatingsystemrelease {
		/^5/: {
			class { "yum":
				extrarepo => [ 'centos5', 'epel', 'remi', 'rpmforge', 'puppetlabs' ],
				clean_repos => true,
			}
		}
		/^6/: {
			class { "yum":
				extrarepo => [ 'centos6', 'epel', 'remi', 'rpmforge', 'puppetlabs' ],
				clean_repos => true,
			}
		}
	}
	include yum::repo::lewa
	#公共用户及目录构建	
	group { 'web' :
		ensure => present,
	}
	user { 'web' :
		ensure => present,
		uid => '5000',
		gid => 'web',
		shell => '/sbin/nologin',
		home => '/web',
	}
	file { '/web' :
		ensure => directory,
		owner => 'root',
		group => 'root',
		mode => '0754',
	}
	file { '/data' :
		ensure => directory,
		owner => 'root',
		group => 'root',
		mode => '0754'
	}
	
	#公有的基础软件安装
	include ssh, sudo, rsync
	package { ['lrzsz', 'screen', 'unzip', 'make', 'wget', 'curl', 'iptraf', 'nmon'] :
		ensure => present
	}
}

class rework_mysql ($environment = 'client'){

        #common 
        class { 'mysql' :}
        package { 'mysql-devel' :
                ensure => present,
        }
        #options 
        case $environment {
                'client' : {
                        class { ['mysql::python', 'mysql::ruby', 'mysql::java'] : }
                }
                'server' : {
                        class { 'mysql::server' :
                                config_hash => {
                                        datadir => '/data/mysql',
                                }
                        }
                }
        }

}
