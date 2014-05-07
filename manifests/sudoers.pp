class user_account::sudoers ( $users ){

    # Define for adding users
    define add_to_sudoers {
        $user=$name['user']
        if ( $name['nopass'] == true ) {
            exec { "sudoNoPass-${user}":
                path    => ['/bin','/usr/bin'],
                command => "echo \"${user} ALL=(ALL) NOPASSWD:ALL\" >> /etc/sudoers.d/${user}",
                unless  => "grep NOPASSWD /etc/sudoers.d/${user}"
            }
        }
        if ( $name['allow_non_tty'] == true ) {
            exec { "sudoNoTty-${user}":
                path    => ['/bin','/usr/bin'],
                command => "echo \"Defaults:${user} !requiretty\" >> /etc/sudoers.d/${user}",
                unless  => "grep requiretty /etc/sudoers.d/${user}"
            }
        }
    }

    add_to_sudoers { $users: }
}
