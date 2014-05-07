
Puppet Module:  user_profile
============================

This module will manage dotfiles and profiles for one or many users.

Example: 
```
---
- user: tylerwalts
  ssh_key_content: HEX_VALUE_OF_SSH_KEY
  nopass: true
  allow_non_tty: false
- user: jrnt30
  ssh_key_content: ANOTHER_HEX_VALUE
  nopass: false
  allow_non_tty: true
```
