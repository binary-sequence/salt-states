software-for-life-repo:
  pkgrepo.managed:
    - name: software-for-life
    - enabled: true
    - baseurl:
{% if grains['cpuarch'] == 'armv7l' %}
        https://download.opensuse.org/repositories/home:/binary_sequence:/software-for-life/openSUSE_Factory_ARM/
{% elif grains['cpuarch'] == 'x86_64' %}
  {% if grains['lsb_distrib_codename'] == 'openSUSE Tumbleweed' %}
        https://download.opensuse.org/repositories/home:/binary_sequence:/software-for-life/openSUSE_Tumbleweed/
  {% elif grains['lsb_distrib_codename'] == 'openSUSE Leap 15.0' %}
        https://download.opensuse.org/repositories/home:/binary_sequence:/software-for-life/openSUSE_Leap_15.0/
  {% endif %}
{% endif %}
