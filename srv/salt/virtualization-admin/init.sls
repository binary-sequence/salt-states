virtualization-admin.packages_installed:
  pkg.installed:
    - pkgs:
      - virt-manager
      - virtualbox

virtualization-admin.vboxusers_group_present:
  group.present:
    - name: vboxusers
    - addusers:
      - sergio
