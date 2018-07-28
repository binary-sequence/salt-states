include:
  - software-for-life.config_directory

terminator.package_installed:
  pkg.installed:
    - name: terminator

terminator.config_directory_created:
  file.directory:
    - name: /etc/software-for-life/terminator
    - user: root
    - group: salt
    - mode: 755
    - require:
      - pkg: terminator.package_installed
      - file: software-for-life.config_directory

terminator.main_config_file_created:
  file.managed:
    - name: /etc/software-for-life/terminator/config
    - source: salt://workstation/terminator/config
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: terminator.package_installed
      - file: terminator.config_directory_created

terminator.user_config_directory_created:
  file.directory:
    - name: /home/sergio/.config/terminator
    - user: sergio
    - group: users
    - mode: 700
    - require:
      - pkg: terminator.package_installed

terminator.user_main_config_created:
  file.symlink:
    - name: /home/sergio/.config/terminator/config
    - target: /etc/software-for-life/terminator/config
    - user: sergio
    - group: users
    - mode: 600
    - require:
      - file: terminator.user_config_directory_created
      - file: terminator.main_config_file_created
