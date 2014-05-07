# Class: user_account::exist
# Some doc
class user_account::exist ( $users ) {
  define exist {
      user { "${name['user']}":
          ensure      => 'present',
          name        => $name['user'],
          shell       => '/bin/bash',
          managehome  => true,
          groups      => ['users'],
      }
  }
  exist { $users: }
}