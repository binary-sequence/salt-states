include:
  - workstation.shutter
  - workstation.vscode

workstation.packages_installed:
  pkg.installed:
    - pkgs:
      - terminator
    - require:
      - pkg: shutter.package_installed
      - pkg: vscode.package_installed

workstation.shutter_configured:
  require:
    - file: shutter.user_main_config_created
    - file: shutter.user_drawingtool_config_created
