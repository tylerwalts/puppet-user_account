define user_account::sudoers (
    $user = $title,
    $ssh_key_content = undef,
    $ssh_key_type = 'rsa',
    $nopass = undef,
    $allow_non_tty = undef,
  ){
    if ( $nopass == true ) {
        exec { "sudoNoPass-${user}":
            path    => ['/bin','/usr/bin'],
            command => "echo \"${user} ALL=(ALL) NOPASSWD:ALL\" >> /etc/sudoers.d/${user}",
            unless  => "grep NOPASSWD /etc/sudoers.d/${user}"
        }
    }
    if ( $allow_non_tty == true ) {
        exec { "sudoNoTty-${user}":
            path    => ['/bin','/usr/bin'],
            command => "echo \"Defaults:${user} !requiretty\" >> /etc/sudoers.d/${user}",
            unless  => "grep requiretty /etc/sudoers.d/${user}"
        }
    }
}