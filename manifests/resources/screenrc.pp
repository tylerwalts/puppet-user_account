define user_account::resources::screenrc ( $user = $title ){
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
