include:
  - workstation.shutter
  - workstation.terminator
  - workstation.vscode

workstation.packages_installed:
  require:
    - pkg: shutter.installed
    - pkg: terminator.installed
    - pkg: vscode.installed

workstation.shutter_configured:
  require:
    - file: shutter.user_main_config_created
    - file: shutter.user_drawingtool_config_created
