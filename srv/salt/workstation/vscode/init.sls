include:
  - software-for-life.config_directory

vscode.repository:
  pkgrepo.managed:
    - name: Visual Studio Code
    - enable: true
    - baseurl:
        https://packages.microsoft.com/yumrepos/vscode

vscode.package_installed:
  pkg.installed:
    - pkgs:
      - code
    - require:
      - pkgrepo: vscode.repository

vscode.config_directory_created:
  file.directory:
    - name: /etc/software-for-life/vscode
    - user: root
    - group: salt
    - mode: 755
    - require:
      - pkg: vscode.package_installed
      - file: software-for-life.config_directory

vscode.main_config_file_created:
  file.managed:
    - name: /etc/software-for-life/vscode/settings.json
    - source: salt://workstation/vscode/settings.json
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: vscode.package_installed
      - file: vscode.config_directory_created

vscode.user_config_directory_created:
  file.directory:
    - name: /home/sergio/.config/Code/User
    - user: sergio
    - group: users
    - mode: 700
    - require:
      - pkg: vscode.package_installed

vscode.user_main_config_created:
  file.symlink:
    - name: /home/sergio/.config/Code/User/settings.json
    - target: /etc/software-for-life/vscode/settings.json
    - user: sergio
    - group: users
    - mode: 600
    - require:
      - file: vscode.user_config_directory_created
      - file: vscode.main_config_file_created
