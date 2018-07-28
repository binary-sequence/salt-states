include:
  - software-for-life.repository

console-developer.packages:
  pkg.installed:
    - pkgs:
      - git-helper
    - require:
      - pkgrepo: software-for-life.repository
