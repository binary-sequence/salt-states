sshfs.installed:
  pkg.installed:
    - name: sshfs

sshfs.config_file_created:
  file.managed:
    - name: /etc/fuse.conf
    - source: salt://console-admin/sshfs/fuse.conf
    - user: root
    - group: root
    - mode: 644
    - backup: minion
