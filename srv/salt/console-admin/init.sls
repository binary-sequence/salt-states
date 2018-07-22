console-admin.repositories:
  pkgrepo.managed:
    - name: software-for-life
    - enabled: true
    - baseurl: https://download.opensuse.org/repositories/home:/binary_sequence:/software-for-life/openSUSE_Factory_ARM/

console-admin.packages:
  pkg.installed:
    - pkgs:
      - bash-helper
      - fix-filenames-broken-encoding
      - vim
    - require:
      - pkgrepo: console-admin.repositories

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
