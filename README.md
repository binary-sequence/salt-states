# salt-states
My personal salt states

## Index

1. [Available roles](#1-available-roles)
2. [Understanding directory tree](#2-understanding-directory-tree)
3. [Configuration for salt master](#3-configuration-for-salt-master)
4. [Configuration for salt minions](#4-configuration-for-salt-minions)
5. [Applying salt states](#5-applying-salt-states)

## 1. Available roles

- console-admin
- console-developer
- docker-admin
- laptop
- workstation
- openqa-webui
- openqa-worker
- salt-master

## 2. Understanding directory tree

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

## 4. Configuration for salt minions

By default, salt-minions expect the salt-master to have the hostname _salt_. Since I am using **rpi2b**, this have to be configured on each minion on its configuration file.

/etc/salt/minion

```salt
# ... other configuration ...
# Set the location of the salt master server. If the master server cannot be
# resolved, then the minion will fail to start.
master: rpi2b
# ... other configuration ...
```

Then, I have the following minions with different roles:

#### rpi2b

/etc/salt/grains

```salt
roles:
  - salt-master
  - console-admin
  - console-developer
```

#### eva-leap15

/etc/salt/grains

```salt
roles:
  - console-admin
  - console-developer
  - docker-admin
  - workstation
  - openqa-webui
  - openqa-worker
```

#### adam-tw

/etc/salt/grains

```salt
roles:
  - console-admin
  - console-developer
  - docker-admin
  - workstation
  - laptop
```

#### sergio-latitude

/etc/salt/grains

```salt
roles:
  - console-admin
  - console-developer
  - docker-admin
  - workstation
  - openqa-webui
  - openqa-worker
  - laptop
```

## 5. Applying salt states

Once the master and the minions are properly configured, the services have to be started:

```bash
sergio@rpi2b:~$ sudo systemctl enable salt-master.service
sergio@rpi2b:~$ sudo systemctl start salt-master.service
sergio@rpi2b:~$ sudo systemctl enable salt-minion.service
sergio@rpi2b:~$ sudo systemctl start salt-minion.service
```

```bash
sergio@eva-leap15:~$ sudo systemctl enable salt-minion.service
sergio@eva-leap15:~$ sudo systemctl start salt-minion.service
```

```bash
sergio@adam-tw:~$ sudo systemctl enable salt-minion.service
sergio@adam-tw:~$ sudo systemctl start salt-minion.service
```

```bash
sergio@sergio-latitude:~$ sudo systemctl enable salt-minion.service
sergio@sergio-latitude:~$ sudo systemctl start salt-minion.service
```

Then, the states can be applied with the following command:

```bash
sergio@rpi2b:~$ sudo salt '*' state.apply
```
