class user_account::sudoers ( $users ){

    # Define for adding users
    define add_to_sudoers (
        $noPass     = "true",
        $disabletty = "true",
    ) {
        notify {"sudoing $name":}
        if ( "$noPass" == "true" ) {
            exec { 'sudoNoPass-$name':
                path    => ['/bin','/usr/bin'],
                command => "echo \"$name ALL=(ALL) NOPASSWD:ALL\" >> /etc/sudoers.d/$name",
                unless  => "grep NOPASSWD /etc/sudoers.d/$name"
            }
        }
        if ( "$disabletty" == "true" ) {
            exec { 'sudoNoTty-$name':
                path    => ['/bin','/usr/bin'],
                command => "echo \"Defaults:$name !requiretty\" >> /etc/sudoers.d/$name",
                unless  => "grep requiretty /etc/sudoers.d/$name"
            }
        }
    }

    add_to_sudoers { $users: }
}
