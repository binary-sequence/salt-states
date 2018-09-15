include:
  - software-for-life.repository_added

docker-admin.packages_installed:
  pkg.installed:
    - pkgs:
      - docker-helper
    - require:
      - pkgrepo: software-for-life.repository_added
  service.running:
    - name: docker.service
    - enable: true
    - require:
      - pkg: docker-admin.packages
