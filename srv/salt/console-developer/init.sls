include:
  - software-for-life.repository_added
  - console-developer.git

console-developer.packages_installed:
  pkg.installed:
    - pkgs:
      - git-helper
    - require:
      - pkgrepo: software-for-life.repository_added

console-developer.programs_configured:
  test.nop: []
  require:
    - file: git.main_config_file_created
