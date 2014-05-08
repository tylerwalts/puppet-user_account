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
#   merged version if there is a 'user_account::users'
#   key found in the Hiera hierarchy
#
class user_account ($users = undef){

    # Get a hash of users to manage
    $all_users = hiera_hash('user_account::users',$users)

    # Call a define with the superset of all user account parameters
    create_resources('user_account::manage', $all_users)

}
