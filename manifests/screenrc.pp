define user_account::screenrc (
    $user = $title,
    $ssh_key_content = undef,
    $ssh_key_type = 'rsa',
    $nopass = undef,
    $allow_non_tty = undef,
  ){
    if ( $user == 'root'){
        $user_home='/root'
    }else{
        $user_home="/home/${user}"
    }

    # For managing Screen preferences
    file { "${user_home}/.screenrc":
        owner   => $user,
        group   => $user,
        source  => 'puppet:///modules/user_account/screenrc',
    }
}