virtualization-admin.packages_installed:
  pkg.installed:
    - pkgs:
      - virtualbox

virtualization-admin.vboxusers_group_present:
  group.present:
    - name: vboxusers
    - addusers:
      - sergio
