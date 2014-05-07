# Class: user_account
# manages the SSH key if defined in the user hash
class user_account::ssh_key ( $users ) {
    # Define: user_account::ssh_key
    define ssh_key {
        if ($name['user'] != undef and $name['ssh_key_content'] != undef ) {
            $user = $name['user']
            $key_type = 'rsa'

            if ( $user == 'root'){
                $user_home='/root'
                notify{'Creating ssh_authorized_key entry for root even though this is not recommended':}
            } else {
                $user_home="/home/${user}"
            }

            if ( $name['type'] != undef ) {
                $key_type = $name['type']
            }

            ssh_authorized_key { "${user}-ssh-key":
                ensure  => present,
                key     => $name['ssh_key_content'],
                user    => $user,
                type    => $key_type
            }
        }
    }

    ssh_key{ $users: }
}