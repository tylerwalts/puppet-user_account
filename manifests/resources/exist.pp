# Class: user_account::exist

define user_account::resources::exist (
    $user = $title,
    $ensure = present
  ){
    user { $title:
      ensure      => $ensure,
      name        => $user,
      shell       => '/bin/bash',
      managehome  => true,
      groups      => ['users'],
    }
}
