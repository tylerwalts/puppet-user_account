class user_account::screenrc ( $users ) {

    define user_screenrc ($user = $title) {
        # For managing Screen preferences
        file { "/home/$user/.screenrc":
            owner   => $user,
            group   => $user,
            source  => "puppet:///modules/user_account/screenrc",
        }
    }

    # Call the define for every member of the users array passed in
    user_screenrc { $users: }

}
