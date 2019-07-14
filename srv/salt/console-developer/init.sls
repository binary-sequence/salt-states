include:
  - software-for-life.repository_added
  - console-developer.git

console-developer.packages_installed:
  pkg.installed:
    - pkgs:
      - git-helper
    - require:
      - pkgrepo: software-for-life.repository_added
      - pkg: git.installed

console-developer.programs_configured:
  test.nop:
    - require:
      - file: git.main_config_file_created

console-developer.developers_group_created:
  group.present:
    - name: developers
    - addusers:
      - sergio

console-developer.dialout_group_exists:
  group.present:
    - name: dialout
    - addusers:
      - sergio

console-developer.docker_group_exists:
  group.present:
    - name: docker
    - addusers:
      - sergio
