class user_account::screenrc ( $users ) {

    define user_screenrc {
        $user = $name['user']
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

    # Call the define for every member of the users array passed in
    user_screenrc { $users: }

}
