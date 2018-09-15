include:
  - software-for-life.repository_added
  - console-admin.tmux
  - console-admin.vim

console-admin.packages_installed:
  pkg.installed:
    - pkgs:
      - bash-helper
      - fix-filenames-broken-encoding
      - htop
      - mosh
      - tree
    - require:
      - pkgrepo: software-for-life.repository_added
      - pkg: tmux.package
      - pkg: vim.package
