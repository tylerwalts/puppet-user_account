define user_account::resources::bashrc ( $user = $title ){
    if ( $user == 'root'){
        $user_home='/root'
    } else {
        $user_home="/home/${user}"
    }

    # For hook to managing Bash preferences
    $bash_file = "${user_home}/.bashrc"
    $bash_hook_dest = "${user_home}/.bashlib/bashrc.sh"
    $bash_file_content = "source ${bash_hook_dest}"

    exec { "bashrc_hook_${user}":
        path    => ['/bin'],
        command => "echo \"\n${bash_file_content}\" >> ${bash_file}",
        require => File["${user_home}/.bashlib"],
        unless  => "grep \"${bash_file_content}\" ${bash_file}",
    }
}
