include:
  - software-for-life.config_directory_created

grc.installed:
  pkg.installed:
    - name: grc

grc.config_directory_created:
  file.directory:
    - name: /etc/software-for-life/grc
    - user: root
    - group: salt
    - mode: 755
    - require:
      - pkg: grc.installed
      - file: software-for-life.config_directory_created

grc.apache_access_config_file_created:
  file.managed:
    - name: /etc/software-for-life/grc/conf.apache-access
    - source: salt://console-admin/grc/conf.apache-access
    - user: root
    - group: root
    - mode: 644
    - require:
      - file: grc.config_directory_created

grc.apache_error_config_file_created:
  file.managed:
    - name: /etc/software-for-life/grc/conf.apache-error
    - source: salt://console-admin/grc/conf.apache-error
    - user: root
    - group: root
    - mode: 644
    - require:
      - file: grc.config_directory_created

grc.user_config_directory_created:
  file.directory:
    - name: /home/sergio/.grc
    - user: sergio
    - group: users
    - mode: 700
    - require:
      - pkg: grc.installed

grc.user_apache_access_config_file_created:
  file.symlink:
    - name: /home/sergio/.grc/conf.apache-access
    - target: /etc/software-for-life/grc/conf.apache-access
    - user: sergio
    - group: users
    - mode: 600
    - require:
      - file: grc.user_config_directory_created
      - file: grc.apache_access_config_file_created

grc.user_apache_error_config_file_created:
  file.symlink:
    - name: /home/sergio/.grc/conf.apache-error
    - target: /etc/software-for-life/grc/conf.apache-error
    - user: sergio
    - group: users
    - mode: 600
    - require:
      - file: grc.user_config_directory_created
      - file: grc.apache_access_config_file_created
