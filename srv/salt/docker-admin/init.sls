include:
  - software-for-life-repo

docker-admin.packages:
  pkg.installed:
    - pkgs:
      - docker-helper
    - require:
      - pkgrepo: software-for-life-repo
  service.running:
    - name: docker.service
    - enable: true
    - require:
      - pkg: docker-admin.packages
