# Simple resource to turn off the terminal beep
define user_account::resources::inputrc ( $user = $title ){
    if ( $user == 'root'){
        $user_home='/root'
    }else{
        $user_home="/home/${user}"
    }

    file {"${user_home}/.inputrc":
        ensure  => 'present',
        path    => "${user_home}/.inputrc",
        owner   => $user,
        mode    => '0644',
    } ->
    file_line { "${user_home}/.inputrc":
        ensure  => 'present',
        path    => "${user_home}/.inputrc",
        line    => 'set bell-style none'
    }
}
