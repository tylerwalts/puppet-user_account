
class user_account::bashlib ( $users ) {

    define user_bashlib ($user = $title) {
        # For managing bash library
        file { "/home/$user/.bashlib":
            ensure => directory,
            recurse => true,
            owner   => $user,
            group   => $user,
            mode => 0644,
            source  => "puppet:///modules/user_account/bashlib",
        }
    }

    user_bashlib { $users: }
}
