git.installed:
  pkg.installed:
    - name: git

git.perl_library_directory_created:
  file.directory:
    - name: /usr/local/lib/perl5/
    - user: root
    - group: salt
    - mode: 755

git.diff_highlight_module_installed:
  file.managed:
    - name: /usr/local/lib/perl5/DiffHighlight.pm
    - source: salt://console-developer/git/DiffHighlight.pm
    - user: root
    - group: salt
    - mode: 755
    - backup: minion
    - require:
      - file: git.perl_library_directory_created

git.diff_highlight_script_installed:
  file.managed:
    - name: /usr/local/bin/diff-highlight.pl
    - source: salt://console-developer/git/diff-highlight.pl
    - user: root
    - group: salt
    - mode: 755
    - backup: minion
    - require:
      - file: git.diff_highlight_module_installed

git.main_config_file_created:
  file.managed:
    - name: /etc/gitconfig
    - source: salt://console-developer/git/gitconfig
    - user: root
    - group: salt
    - mode: 755
    - backup: minion
    - require:
      - pkg: git.installed
      - file: git.diff_highlight_script_installed
