include:
  - workstation.shutter
  - workstation.terminator
  - workstation.vscode

workstation.packages_installed:
  require:
    - pkg: shutter.installed
    - pkg: terminator.installed
    - pkg: vscode.installed

workstation.programs_configured:
  require:
    - file: shutter.user_config_file_created
    - file: shutter.user_drawingtool_config_file_created
    - file: terminator.user_config_file_created
    - file: vscode.user_config_file_created
