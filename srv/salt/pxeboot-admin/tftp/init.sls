tftp.installed:
  pkg.installed:
    - pkgs:
      - tftp
      - xinetd

tftp.tftp_configured:
  file.managed:
    - name: /etc/xinetd.d/tftp
    - source: salt://pxeboot-admin/tftp/tftp
    - user: root
    - group: root
    - mode: 644
    - backup: minion
    - require:
      - pkg: tftp.installed
