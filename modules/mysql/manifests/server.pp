# Class: mysql::server
#
# manages the installation of the mysql server.  manages the package, service,
# my.cnf
#
# Parameters:
#  [*config_hash*]      - hash of config parameters that need to be set.
#  [*enabled*]          - Defaults to true, boolean to set service ensure.
#  [*manage_service*]   - Boolean dictating if mysql::server should manage the service
#  [*package_ensure*]   - Ensure state for package. Can be specified as version.
#  [*package_name*]     - The name of package
#  [*service_name*]     - The name of service
#  [*service_provider*] - What service provider to use.

#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class mysql::server (
  $config_hash      = {},
  $enabled          = true,
  $manage_service   = true,
  $package_ensure   = $mysql::package_ensure,
  $package_name     = $mysql::server_package_name,
  $service_name     = $mysql::service_name,
  $service_provider = $mysql::service_provider
) inherits mysql {

  Class['mysql::server'] -> Class['mysql::config']

  $config_class = { 'mysql::config' => $config_hash }

  create_resources( 'class', $config_class )

  package { 'mysql-server':
    ensure => $package_ensure,
    name   => $package_name,
  }
 # notify{"paramter \$my_user is empty, please check it ${config_hash['datadir']}" :} 
  if $config_hash['datadir'] != '' {
	exec { 'import data' :
		command => "/usr/bin/mysql_install_db --user=mysql --datadir=${$config_hash['datadir']}",
		creates => "${$config_hash['datadir']}/performance_schema/db.opt"
	}
	exec { 'datadir change' :
		command => "/usr/bin/chcon -Rt mysqld_db_t ${$config_hash['datadir']}",
		onlyif => "/usr/bin/test `/bin/ls -Z ${$config_hash['datadir']} | grep mysqld_db_t | grep -v grep | wc -l` -eq  0"
	}
  }
  if $enabled {
    $service_ensure = 'running'
  } else {
    $service_ensure = 'stopped'
  }

  if $manage_service {
    service { 'mysqld':
      ensure   => $service_ensure,
      name     => $service_name,
      enable   => $enabled,
      require  => Package['mysql-server'],
      provider => $service_provider,
    }
  }
}
