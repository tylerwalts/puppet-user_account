# = Class: user_account
#
# This class is used to manage a set of users and their
# associated configurations
#
# == Parameters
#
# [*users*]
#   Hash of users to be created for the system
#
#   NOTE: This value WILL be overridden with a fully
#   merged version if there is a 'useraccount_users'
#   key found in the Hiera hierarchy
#
class user_account ($users = undef){
    # Default resources managed for users
    $user_classes = [
        'user_account::exist',
        'user_account::screenrc',
        'user_account::bashlib',
        'user_account::bashrc',
        'user_account::sudoers',
        'user_account::ssh_key',
    ]

    class { $user_classes:
        users => hiera_array('user_account::users',$users)
    }
}