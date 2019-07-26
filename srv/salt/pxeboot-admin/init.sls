include:
  - pxeboot-admin.tftp

pxeboot-admin.packages_installed:
  test.nop:
    - require:
      - pkg: tftp.installed

pxeboot-admin.programs_configured:
  test.nop:
    - require:
      - file: tftp.tftp_configured
