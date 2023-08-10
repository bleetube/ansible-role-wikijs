# Podman

Example using [alvistack/ansible-role-podman](https://github.com/alvistack/ansible-role-podman):


```yaml
- hosts: podman
  become: true

  roles:
    - alvistack.podman

  tasks:
    - name: "Ensure loginctl enable-linger is set for {{ sysadmin_username }}"
      command:
        cmd: "loginctl enable-linger {{ sysadmin_username }}"
        creates: "/var/lib/systemd/linger/{{ sysadmin_username }}"
```

Depending on the OS version you're using, you may have to account for the usage of deprecated apt-key functionality.