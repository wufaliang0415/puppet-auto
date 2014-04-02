class user ($my_user) {
    if $my_user == '' {
            notify{"paramter \$my_user is empty, please check it" :}
    } else {
            $users = split($my_user, ':')
            $users.foreach {|$user|
                  $user_info = split($user, '_')
                  $user_name = $user_info[0]
                  $user_group = $user_info[1]
                  $user_port = $user_info[2]
                  user { $user_name :
                        uid => $user_port,
                        gid => $user_group,
                        groups => $user_group,
                        home => "/home/${user_name}",
                        shell => '/bin/bash',
                        managehome => true
                  }

                  file { "/home/${user_name}/.ssh" :
                        ensure => directory,
                        owner => $user_name,
                        group => $user_group,
                        mode => '0700'
                  }

                  file { "/home/${user_name}/.ssh/authorized_keys" :
                        ensure => present,
                        owner => $user_name,
                        group => 'root',
                        source => "puppet:///extra_files/${client_host}/user/${user_name}/authorized_keys",
                        mode => '0600',
                        replace => true,
                  }

                 # file { "/home/${user_name}/.ssh/id_rsa" :
                 #       ensure => present,
                 #       owner => $user_name,
                 #       group => 'root',
                 #       source => "puppet:///extra_files/${client_host}/${user_name}/id_rsa",
                 #       mode => '0600',
                 #       replace => true
                 # }
            }
    }
}
