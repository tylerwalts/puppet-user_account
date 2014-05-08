# This acts as a controller point to load in other resources as defined by the user hash
# It only passes the minimum parameters needed to the sub-classes.

define user_account::manage (
    $user = $title,
    $exist = true,
    $screenrc = true,
    $bashlib = true,
    $bashrc = true,
    $gradle = true,
    $sudoers = false,
    $sudoers_allow_non_tty = undef,
    $ssh_key_content = undef,
    $ssh_key_type = 'rsa',
  ){

    
    if ! $exist {

        user_account::resources::exist{ $user:
            ensure => absent,
        }

    } else {

        user_account::resources::exist{ $user: }

	if $screenrc {
            user_account::resources::screenrc{ $user: }
        }

	if $bashlib {
            user_account::resources::bashlib{ $user: }
        }

	if $bashrc {
            user_account::resources::bashrc{ $user: }
        }

	if $gradle {
            user_account::resources::gradle{ $user: }
        }

	if $sudoers {
            user_account::resources::sudoers{ $user:
                allow_non_tty => $sudoers_allow_non_tty,
            }
        }

	if $ssh_key_content {
            user_account::resources::ssh_key{ $user: 
                ssh_key_content => $ssh_key_content,
                ssh_key_type => $ssh_key_type,
            }
        }

    }

}
