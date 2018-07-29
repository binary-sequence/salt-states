include:
  - software-for-life.config_directory

tmux.package:
  pkg.installed:
    - name: tmux

tmux.main_config_file:
  file.managed:
    - name: /etc/software-for-life/tmux.conf
    - source: salt://console-admin/tmux/tmux.conf
    - user: root
    - group: salt
    - mode: 755
    - require:
      - pkg: tmux.package
      - file: software-for-life.config_directory

tmux.user_main_config_file:
  file.symlink:
    - name: /home/sergio/.tmux.conf
    - target: /etc/software-for-life/tmux.conf
    - user: sergio
    - group: users
    - mode: 600
    - require:
      - pkg: tmux.package
      - file: tmux.main_config_file
