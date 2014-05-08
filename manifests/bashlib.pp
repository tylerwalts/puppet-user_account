define user_account::bashlib (
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

    # For managing bash library
    file { "${user_home}/.bashlib":
        ensure  => directory,
        recurse => true,
        owner   => $user,
        group   => $user,
        mode    => '0644',
        source  => 'puppet:///modules/user_account/bashlib',
    }
}