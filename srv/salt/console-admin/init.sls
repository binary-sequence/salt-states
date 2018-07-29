include:
  - software-for-life.repository
  - console-admin.vim

console-admin.packages:
  pkg.installed:
    - pkgs:
      - bash-helper
      - fix-filenames-broken-encoding
      - htop
      - mosh
      - tmux
      - tree
    - require:
      - pkgrepo: software-for-life.repository
      - pkg: vim.package
