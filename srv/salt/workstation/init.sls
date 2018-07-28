include:
  - workstation.shutter
  - workstation.terminator
  - workstation.vscode

workstation.packages_installed:
  require:
    - pkg: shutter.package_installed
    - pkg: terminator.package_installed
    - pkg: vscode.package_installed

workstation.shutter_configured:
  require:
    - file: shutter.user_main_config_created
    - file: shutter.user_drawingtool_config_created
