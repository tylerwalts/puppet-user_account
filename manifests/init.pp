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
    $all_users = hiera_hash('user_account::users',$users)

    create_resources('user_account::exist', $all_users)
    create_resources('user_account::screenrc', $all_users)
    create_resources('user_account::bashlib', $all_users)
    create_resources('user_account::bashrc', $all_users)
    create_resources('user_account::sudoers', $all_users)
    create_resources('user_account::ssh_key', $all_users)
}