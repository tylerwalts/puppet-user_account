define user_account::resources::gradle ( $user = $title ){
    if ( $user == 'root'){
        $user_home='/root'
    }else{
        $user_home="/home/${user}"
    }

    # For managing gradle preferences
    $gradle_daemon_setting = 'org.gradle.daemon=true'
    $gradle_settings_file = "${user_home}/.gradle/gradle.properties"
    file { "${user_home}/.gradle":
        ensure  => directory,
        require  => User[$user],
    }
    exec { "gradle daemon setting for $user":
        path    => ['/bin'],
        command => "echo \"\n${gradle_daemon_setting}\" >> ${gradle_settings_file}",
        require => File["${user_home}/.gradle"],
        unless  => "grep \"${gradle_daemon_setting}\" ${gradle_settings_file}",
    }
}
