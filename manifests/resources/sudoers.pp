define user_account::resources::sudoers ( $user = $title,
    $allow_non_tty = undef
  ){
    exec { "sudoNoPass-${user}":
        path    => ['/bin','/usr/bin'],
        command => "echo \"${user} ALL=(ALL) NOPASSWD:ALL\" >> /etc/sudoers.d/${user}",
        unless  => "grep NOPASSWD /etc/sudoers.d/${user}"
    }
    if ( $allow_non_tty == true ) {
        exec { "sudoNoTty-${user}":
            path    => ['/bin','/usr/bin'],
            command => "echo \"Defaults:${user} !requiretty\" >> /etc/sudoers.d/${user}",
            unless  => "grep requiretty /etc/sudoers.d/${user}"
        }
    }
}
