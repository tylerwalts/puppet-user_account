
Puppet Module:  user_profile
============================

This module will manage dotfiles and profiles for one or many users.

Example:
> Please note the use of the empty hash `{}` for the nosettings user.
> You **must** provide a value for every user, even if they will be
> defaulting all the values

```
---
user_account::users:
  tylerwalts:
    ssh_key_content: HEX_VALUE_OF_SSH_KEY
    nopass: true
    allow_non_tty: false
  jrnt30:
    ssh_key_content: ANOTHER_HEX_VALUE
    nopass: false
    allow_non_tty: true
  nosettings: {}
```
