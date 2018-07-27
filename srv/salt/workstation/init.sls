vscode.repository:
  pkgrepo.managed:
    - name: Visual Studio Code
    - enable: true
    - baseurl:
        https://packages.microsoft.com/yumrepos/vscode

workstation.packages:
  pkg.installed:
    - pkgs:
      - code
      - terminator
    - require:
      - pkgrepo: vscode.repository