include:
  - ftp-admin.vsftpd

ftp-admin.packages_installed:
  test.nop:
    - require:
      - pkg: vsftpd.installed

ftp-admin.programs_configured:
  test.nop:
    - require:
      - file: vsftpd.vsftpd_configured
