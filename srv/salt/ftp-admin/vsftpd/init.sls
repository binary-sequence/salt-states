vsftpd.installed:
  pkg.installed:
    - pkgs:
      - vsftpd

vsftpd.vsftpd_configured:
  file.managed:
    - name: /etc/vsftpd.conf
    - source: salt://ftp-admin/vsftpd/vsftpd.conf
    - user: root
    - group: root
    - mode: 600
    - backup: minion
    - require:
      - pkg: vsftpd.installed
