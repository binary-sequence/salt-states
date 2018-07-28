vscode.repository:
  pkgrepo.managed:
    - name: Visual Studio Code
    - enable: true
    - baseurl:
        https://packages.microsoft.com/yumrepos/vscode

vscode.package_installed:
  pkg.installed:
    - pkgs:
      - code
    - require:
      - pkgrepo: vscode.repository
