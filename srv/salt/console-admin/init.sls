include:
  - software-for-life-repo

console-admin.packages:
  pkg.installed:
    - pkgs:
      - bash-helper
      - fix-filenames-broken-encoding
      - htop
      - mosh
      - tmux
      - tree
      - vim
    - require:
      - pkgrepo: software-for-life-repo

vim.extended_config:
  file.managed:
    - name: /etc/binary-sequence/vimrc
    - source: salt://console-admin/binary-sequence.vimrc
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: console-admin.packages

vim.main_config:
  file.managed:
    - name: /etc/vimrc
    - source: salt://console-admin/vimrc
    - user: root
    - group: root
    - mode: 644
    - require:
      - file: vim.extended_config
