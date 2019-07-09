include:
  - software-for-life.config_directory_created

tmux.installed:
  pkg.installed:
    - name: tmux

tmux.main_config_file_created:
  file.managed:
    - name: /usr/local/share/software-for-life/tmux.conf
    - source: salt://console-admin/tmux/tmux.conf
    - user: root
    - group: salt
    - mode: 644
    - backup: minion
    - require:
      - pkg: tmux.installed
      - file: software-for-life.config_directory_created

tmux.user_config_file_created:
  file.symlink:
    - name: /home/sergio/.tmux.conf
    - target: /usr/local/share/software-for-life/tmux.conf
    - user: sergio
    - group: users
    - mode: 600
    - backup: minion
    - require:
      - pkg: tmux.installed
      - file: tmux.main_config_file_created
