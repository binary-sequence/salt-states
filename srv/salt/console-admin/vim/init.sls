vim.installed:
  pkg.installed:
    - name: vim

vim.main_config_file_created:
  file.managed:
    - name: /etc/vimrc
    - source: salt://console-admin/vim/binary-sequence.leap15.1.vimrc
    - user: root
    - group: root
    - mode: 644
    - backup: minion
