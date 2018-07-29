include:
  - software-for-life.config_directory

vim.package:
  pkg.installed:
    - name: vim

vim.extended_config:
  file.managed:
    - name: /etc/software-for-life/vimrc
    - source: salt://console-admin/vim/binary-sequence.vimrc
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: vim.package
      - file: software-for-life.config_directory

vim.main_config:
  file.managed:
    - name: /etc/vimrc
    - source: salt://console-admin/vim/vimrc
    - user: root
    - group: root
    - mode: 644
    - require:
      - file: vim.extended_config
