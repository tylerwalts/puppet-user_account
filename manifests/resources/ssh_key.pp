# Class: user_account
# manages the SSH key if defined in the user hash
define user_account::resources::ssh_key (
    $user = $title,
    $ssh_key_content = undef,
    $ssh_key_type = 'rsa'
  ){
    if ($ssh_key_content != undef ) {
        if ( $user == 'root'){
            $user_home='/root'
            notify{'Creating ssh_authorized_key entry for root even though this is not recommended':}
        } else {
            $user_home="/home/${user}"
        }

        ssh_authorized_key { "${user}-ssh-key":
            ensure  => present,
            key     => $ssh_key_content,
            user    => $user,
            type    => $ssh_key_type
        }
    }
}
