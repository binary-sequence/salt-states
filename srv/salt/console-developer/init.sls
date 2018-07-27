include:
  - software-for-life-repo

console-developer.packages:
  pkg.installed:
    - pkgs:
      - git-helper
    - require:
      - pkgrepo: software-for-life-repo
