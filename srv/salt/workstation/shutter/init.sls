include:
  - software-for-life.config_directory_created

shutter.installed:
  pkg.installed:
    - name: shutter

shutter.config_directory_created:
  file.directory:
    - name: /etc/software-for-life/shutter
    - user: root
    - group: salt
    - mode: 755
    - require:
      - pkg: shutter.installed
      - file: software-for-life.config_directory_created

shutter.main_config_file_created:
  file.managed:
    - name: /etc/software-for-life/shutter/settings.xml
    - source: salt://workstation/shutter/settings.xml
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: shutter.installed
      - file: shutter.config_directory_created

shutter.drawingtool_config_file_created:
  file.managed:
    - name: /etc/software-for-life/shutter/drawingtool.xml
    - source: salt://workstation/shutter/drawingtool.xml
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: shutter.installed
      - file: shutter.config_directory_created

shutter.user_config_directory_created:
  file.directory:
    - name: /home/sergio/.shutter
    - user: sergio
    - group: users
    - mode: 700
    - require:
      - pkg: shutter.installed

shutter.user_picture_directory_created:
  file.directory:
    - name: /home/sergio/Pictures/shutter
    - user: sergio
    - group: users
    - mode: 755
    - require:
      - pkg: shutter.installed

shutter.user_main_config_created:
  file.symlink:
    - name: /home/sergio/.shutter/settings.xml
    - target: /etc/software-for-life/shutter/settings.xml
    - user: sergio
    - group: users
    - mode: 600
    - require:
      - file: shutter.user_config_directory_created
      - file: shutter.main_config_file_created
      - file: shutter.user_picture_directory_created

shutter.user_drawingtool_config_created:
  file.symlink:
    - name: /home/sergio/.shutter/drawingtool.xml
    - target: /etc/software-for-life/shutter/drawingtool.xml
    - user: sergio
    - group: users
    - mode: 600
    - require:
      - file: shutter.user_config_directory_created
      - file: shutter.drawingtool_config_file_created
