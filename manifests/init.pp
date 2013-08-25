class user_account ( $users = hiera('user_account::users') ){

    # Default resources managed for users
    $user_classes = [
        'user_account::exist',
        'user_account::screenrc',
        'user_account::bashlib',
        'user_account::bashrc']

    class { $user_classes:
        users => $users,
    }

}
