include:
  - workstation.shutter

vscode.repository:
  pkgrepo.managed:
    - name: Visual Studio Code
    - enable: true
    - baseurl:
        https://packages.microsoft.com/yumrepos/vscode

workstation.packages_istalled:
  pkg.installed:
    - pkgs:
      - code
      - terminator
    - require:
      - pkgrepo: vscode.repository
      - pkg: shutter.package_installed

workstation.shutter_configured:
  require:
    - file: shutter.user_main_config_created
    - file: shutter.user_drawingtool_config_created
