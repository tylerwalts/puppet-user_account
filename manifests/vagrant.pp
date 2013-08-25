# Create resources that are only used in Vagrant environments
class user_account::vagrant {

    # Link from vagrant home to "code", which is really at /vagrant

    file { '/home/vagrant/code':
        ensure  => link,
        target  => '/vagrant',
    }

}
