include:
  - software-for-life.repository
  - console-admin.tmux
  - console-admin.vim

console-admin.packages:
  pkg.installed:
    - pkgs:
      - bash-helper
      - fix-filenames-broken-encoding
      - htop
      - mosh
      - tree
    - require:
      - pkgrepo: software-for-life.repository
      - pkg: tmux.package
      - pkg: vim.package
