include:
  - software-for-life.config_directory_created

vim.installed:
  pkg.installed:
    - name: vim

vim.extended_config_file_created:
  file.managed:
    - name: /etc/software-for-life/vimrc
    - source: salt://console-admin/vim/binary-sequence.vimrc
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: vim.installed
      - file: software-for-life.config_directory_created

vim.main_config_file_created:
  file.managed:
    - name: /etc/vimrc
    - source: salt://console-admin/vim/vimrc
    - user: root
    - group: root
    - mode: 644
    - require:
      - file: vim.extended_config_file_created
