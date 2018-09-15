include:
  - software-for-life.config_directory_created

tmux.installed:
  pkg.installed:
    - name: tmux

tmux.main_config_file_created:
  file.managed:
    - name: /etc/software-for-life/tmux.conf
    - source: salt://console-admin/tmux/tmux.conf
    - user: root
    - group: salt
    - mode: 755
    - require:
      - pkg: tmux.installed
      - file: software-for-life.config_directory_created

tmux.user_config_file_created:
  file.symlink:
    - name: /home/sergio/.tmux.conf
    - target: /etc/software-for-life/tmux.conf
    - user: sergio
    - group: users
    - mode: 600
    - require:
      - pkg: tmux.installed
      - file: tmux.main_config_file_created
