# salt-states
My personal salt states

## Index

1. [Available roles](#1-available-roles)
2. [Undestanding directory tree](#2-understanding-directory-tree)

## 1. Available roles

- console-admin
- console-developer
- docker-admin
- laptop
- workstation
- openqa-webui
- openqa-worker

## 2. Undestanding directory tree

- Each role has its own directory.
```bash
user@pc:~$ sudo salt '*' state.apply console-admin
```
- Each role may install several packages.
- When a package configuration is also managed by salt, the package gets its own subdirectory (e.g. under the role directory).
```bash
user@pc:~$ sudo salt '*' state.apply workstation.shutter
```
- States shared between different roles or states have their own directory
```bash
user@pc:~$ sudo salt '*' state.apply software-for-life.repository
```
