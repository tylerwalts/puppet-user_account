# Class: user_account::exist
# Some doc

define user_account::exist (
    $user = $title,
    $ssh_key_content = undef,
    $ssh_key_type = 'rsa',
    $nopass = undef,
    $allow_non_tty = undef,
  ){
    user { $title:
      ensure      => 'present',
      name        => $title,
      shell       => '/bin/bash',
      managehome  => true,
      groups      => ['users'],
    }
}