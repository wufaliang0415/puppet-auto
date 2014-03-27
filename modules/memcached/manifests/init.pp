# Class: memcached
#
# Install, enable and configure memcached.
#
# Parameters:
#  $other:
#    Optional other. Default: none
#
# Sample Usage :
#  include memcached
#
class memcached (
  $port      = '11211',
  $user      = 'memcached',
  $maxconn   = '8192',
  $cachesize = '1024',
  $options   = '-l 0.0.0.0 -U 11211 -t 4'
) {

  package { 'memcached': ensure => installed }

  service { 'memcached':
    enable    => true,
    ensure    => running,
    hasstatus => true,
    hasrestart => true,
    require   => Package['memcached'],
  }

  # Configuration
  file { '/etc/sysconfig/memcached':
    content => template('memcached/sysconfig.erb'),
    notify  => Service['memcached'],
    require => Package['memcached'],
  }

}

