include:
  - software-for-life.config_directory_created

shutter.installed:
  pkg.installed:
    - name: shutter

shutter.config_directory_created:
  file.directory:
    - name: /usr/local/share/software-for-life/shutter
    - user: root
    - group: salt
    - mode: 755
    - require:
      - pkg: shutter.installed
      - file: software-for-life.config_directory_created

shutter.main_config_file_created:
  file.managed:
    - name: /usr/local/share/software-for-life/shutter/settings.xml
    - source: salt://workstation/shutter/settings.xml
    - user: root
    - group: root
    - mode: 644
    - backup:  minion
    - require:
      - pkg: shutter.installed
      - file: shutter.config_directory_created

shutter.drawingtool_config_file_created:
  file.managed:
    - name: /usr/local/share/software-for-life/shutter/drawingtool.xml
    - source: salt://workstation/shutter/drawingtool.xml
    - user: root
    - group: root
    - mode: 644
    - backup: minion
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

shutter.user_pictures_directory_created:
  file.directory:
    - name: /home/sergio/Imágenes/shutter
    - user: sergio
    - group: users
    - mode: 755
    - require:
      - pkg: shutter.installed

shutter.user_config_file_created:
  file.symlink:
    - name: /home/sergio/.shutter/settings.xml
    - target: /usr/local/share/software-for-life/shutter/settings.xml
    - user: sergio
    - group: users
    - mode: 600
    - backup: minion
    - require:
      - file: shutter.user_config_directory_created
      - file: shutter.main_config_file_created
      - file: shutter.user_pictures_directory_created

shutter.user_drawingtool_config_file_created:
  file.symlink:
    - name: /home/sergio/.shutter/drawingtool.xml
    - target: /usr/local/share/software-for-life/shutter/drawingtool.xml
    - user: sergio
    - group: users
    - mode: 600
    - backup: minion
    - require:
      - file: shutter.user_config_directory_created
      - file: shutter.drawingtool_config_file_created
