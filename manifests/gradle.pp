class user_account::gradle ( $users ) {

    define user_gradle_settings ($user = $title) {
        if ( "$user" == "root"){
            $user_home="/root"
        }else{
            $user_home="/home/$user"
        }

        # For managing gradle preferences
        $gradle_daemon_setting = "org.gradle.daemon=true"
        $gradle_settings_file = "$user_home/.gradle/gradle.properties"
        file { "$user_home/.gradle":
            ensure  => directory,
        }
        exec { "gradle_daemon_setting":
            path    => ['/bin'],
            command => "echo \"\n$gradle_daemon_setting\" >> $gradle_settings_file",
            require => File["$user_home/.gradle"],
            unless  => "grep \"$gradle_daemon_setting\" $gradle_settings_file",
        }
    }

    # Call the define for every member of the users array passed in
    user_gradle_settings { $users: }

}
