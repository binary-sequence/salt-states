include:
  - software-for-life.repository_added
  - console-admin.grc
  - console-admin.tmux
  - console-admin.vim

console-admin.packages_installed:
  pkg.installed:
    - pkgs:
      - fix-filenames-broken-encoding
      - htop
      - mosh
      - tree
    - require:
      - pkgrepo: software-for-life.repository_added
      - pkg: grc.installed
      - pkg: tmux.installed
      - pkg: vim.installed

console-admin.programs_configured:
  test.nop: []
  require:
    - file: grc.user_apache_access_config_file_created
    - file: grc.user_apache_error_config_file_created
    - file: tmux.user_config_file_created
    - file: vim.main_config_file_created
