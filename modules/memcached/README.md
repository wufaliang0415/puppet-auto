# puppet-memcached

## Overview

Install, enable and configure memcached.

* `memcached` : Class to install and enable the server

## Examples

Simple instance with all the defaults, port 11211, user memcached, 1024 max
connections and 64MB cache size :

    include memcached

Tweaked instance :

    class { 'memcached':
        port      => '11219',
        maxconn   => '8192',
        cachesize => '2048',  # 2GB
    }

You can also use the `$options` parameter to pass any custom command-line
options to the memcached program.

