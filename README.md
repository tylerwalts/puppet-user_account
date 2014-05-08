
Puppet Module:  user_profile
============================

This module will manage dotfiles and profiles for one or many users.

Example:
> Please note the use of the empty hash `{}` for the nosettings user.
> You **must** provide a hiera hash object for every user, even if they will be
> defaulting all the values

```
---
user_account::users:
  tylerwalts:
    ssh_key_content: HEX_VALUE_OF_SSH_KEY
    sudoers: true
    gradle: true
  jrnt30:
    ssh_key_content: ANOTHER_HEX_VALUE
    sudoers: false
  user_with_default_settings: {}
  root: {}
  banned_user:
    exist: false
  service_account:
    ssh_key_content: YET_ANOTHER_HEX_VALUE
    sudoers: true
    sudoers_allow_non_tty: true
    screenrc: false
    bashlib: false
    bashrc: false
```

Upgrading from 1.x to 2.x
-------------------------
Note for users of the 1.0 tag and earlier, if your old hiera config was an array like this:

```
  user_account::users:
    - "root"
    - "vagrant"
```

...then it needs to be changed to a hash tree like so:

```
  user_account::users:
    root: {}
    vagrant: {}
```



