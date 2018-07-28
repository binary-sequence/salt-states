include:
  - software-for-life.repository

docker-admin.packages:
  pkg.installed:
    - pkgs:
      - docker-helper
    - require:
      - pkgrepo: software-for-life.repository
  service.running:
    - name: docker.service
    - enable: true
    - require:
      - pkg: docker-admin.packages
