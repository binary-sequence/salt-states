include:
  - software-for-life.repository_added
  - console-admin.grc
  - console-admin.sshfs
  - console-admin.tmux
  - console-admin.vim

console-admin.packages_installed:
  pkg.installed:
    - pkgs:
      - fix-filenames-broken-encoding
      - fuse-exfat
      - htop
      - mosh
      - nmap
      - rsync
      - tree
    - require:
      - pkgrepo: software-for-life.repository_added
      - pkg: grc.installed
      - pkg: sshfs.installed
      - pkg: tmux.installed
      - pkg: vim.installed

console-admin.bashrc_file_created:
  file.managed:
    - name: /usr/local/share/software-for-life/bashrc
    - source: salt://console-admin/bashrc
    - user: root
    - group: root
    - mode: 644
    - backup: minion

console-admin.bashrc_file_configured:
  file.symlink:
    - name: /home/sergio/.bashrc
    - target: /usr/local/share/software-for-life/bashrc
    - user: sergio
    - group: users
    - mode: 600
    - backup: minion
    - force: true
    - require:
      - file: console-admin.bashrc_file_created

console-admin.bashrc_color_prompt_file_created:
  file.managed:
    - name: /usr/local/share/software-for-life/bashrc_color_prompt
    - source: salt://console-admin/bashrc_color_prompt
    - user: root
    - group: root
    - mode: 644
    - backup: minion

console-admin.bashrc_color_prompt_file_configured:
  file.symlink:
    - name: /home/sergio/.bashrc_color_prompt
    - target: /usr/local/share/software-for-life/bashrc_color_prompt
    - user: sergio
    - group: users
    - mode: 600
    - backup: minion
    - force: true
    - require:
      - file: console-admin.bashrc_color_prompt_file_created
      - file: console-admin.bashrc_file_configured

console-admin.alias_file_created:
  file.managed:
    - name: /usr/local/share/software-for-life/alias
    - source: salt://console-admin/alias
    - user: root
    - group: root
    - mode: 644
    - backup: minion

console-admin.alias_file_configured:
  file.symlink:
    - name: /home/sergio/.alias
    - target: /usr/local/share/software-for-life/alias
    - user: sergio
    - group: users
    - mode: 600
    - backup: minion
    - require:
      - file: console-admin.alias_file_created
      - file: console-admin.bashrc_file_configured

console-admin.alias_suse_file_created:
  file.managed:
    - name: /usr/local/share/software-for-life/alias_suse
    - source: salt://console-admin/alias_suse
    - user: root
    - group: root
    - mode: 644
    - backup: minion

console-admin.alias_suse_file_configured:
  file.symlink:
    - name: /home/sergio/.alias_suse
    - target: /usr/local/share/software-for-life/alias_suse
    - user: sergio
    - group: users
    - mode: 600
    - backup: minion
    - require:
      - file: console-admin.alias_suse_file_created
      - file: console-admin.alias_file_configured

console-admin.sudoers_file_configured:
  file.managed:
    - name: /etc/sudoers
    - source: salt://console-admin/sudoers
    - user: root
    - group: root
    - mode: 440
    - backup: minion

console-admin.programs_configured:
  test.nop:
    - require:
      - file: console-admin.alias_file_configured
      - file: console-admin.alias_suse_file_configured
      - file: console-admin.bashrc_file_configured
      - file: console-admin.bashrc_color_prompt_file_configured
      - file: grc.user_apache_access_config_file_created
      - file: grc.user_apache_error_config_file_created
      - file: tmux.user_config_file_created
      - file: vim.main_config_file_created

console-admin.sysadmins_group_created:
  group.present:
    - name: sysadmins
    - addusers:
      - sergio
