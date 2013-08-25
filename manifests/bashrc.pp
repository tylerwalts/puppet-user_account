class user_account::bashrc ( $users ) {

    define user_bashrc ($user = $title) {
        # For hook to managing Bash preferences
        $bash_file = "/home/$user/.bashrc"
        $bash_hook_dest = "/home/$user/.bashlib/bashrc.sh"
        $bash_file_content = "source $bash_hook_dest"

        exec { "bashrc_hook_$user":
            path    => ['/bin'],
            command => "echo \"\n$bash_file_content\" >> $bash_file",
            require => File["/home/$user/.bashlib"],
            unless  => "grep \"$bash_file_content\" $bash_file",
        }
    }

    # Call the define for every member of the users array passed in
    user_bashrc { $users: }

}
