include:
  - software-for-life

console-developer.packages:
  pkg.installed:
    - pkgs:
      - git-helper
    - require:
      - pkgrepo: software-for-life.repository
