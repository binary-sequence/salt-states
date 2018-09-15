include:
  - software-for-life.repository_added

console-developer.packages_installed:
  pkg.installed:
    - pkgs:
      - git-helper
    - require:
      - pkgrepo: software-for-life.repository_added
