# salt-states
My personal salt states

## Index

1. [Available roles](#1-available-roles)
2. [Undestanding directory tree](#2-understanding-directory-tree)
3. [Configuration for salt master](#3-configuration-for-salt-master)

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

## 3. Configuration for salt master

My salt master is a Raspberry Pi 2 model B with openSUSE Tumbleweed.

A hostname, that will be used by the minions, needs to be set. I chose the name **rpi2b**.

Then, the package **binary-sequence-salt-master** (not yet available) needs to be installed.

The package will install the salt-states and a _top.sls_ file on the _/srv/salt/_ directory. If the salt-master is going to have more configuration on the _top.sls_ file, only the salt states can be installed:
**binary-sequence-salt-states** (not yet available).

These packages are not available in the official repositories, so the personal repo needs to be added:

```bash
user@pc:~$ sudo zypper addrepo <not yet available> binary-sequence
user@pc:~$ sudo zypper install binary-sequence:binary-sequence-salt-master
```
