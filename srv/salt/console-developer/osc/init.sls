osc.dependencies_installed:
  pkg.installed:
    - pkgs:
      - python3-keyring

osc.installed:
  pkg.installed:
    - name: osc
    - require:
      - pkg: osc.dependencies_installed

osc.osc_config_directory_created:
  file.directory:
    - name: /home/sergio/.config/osc
    - user: sergio
    - group: users
    - mode: 700

osc.config_file_created:
  file.managed:
    - name: /home/sergio/.config/osc/oscrc
    - source: salt://console-developer/osc/oscrc
    - user: sergio
    - group: users
    - mode: 600
    - replace: False
    - require:
      - pkg: osc.installed
      - file: osc.osc_config_directory_created
