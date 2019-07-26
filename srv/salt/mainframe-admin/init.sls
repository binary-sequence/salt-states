include:
  - ftp-admin.vsftpd

mainframe-admin.packages_installed:
  pkg.installed:
    - pkgs:
      - x3270
    - require:
      - file: vsftpd.vsftpd_configured
