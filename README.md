# Ansible Role: wikijs

This Ansible Role installs a rootless [wikijs](https://docs.requarks.io/guide/intro) container using Podman. It is intended to be composed with separate roles for Podman, database, and web proxy.

## Requirements

* [podman](docs/PODMAN.md)
* [containers.podman](https://github.com/containers/ansible-podman-collections)

## Dependencies

* [postgresql](docs/POSTGRES.md) (optional)
* [nginx_conf](docs/examples/nginx_conf.yml) (optional)

## Role Variables

See the role [defaults](defaults/main.yml) and the wikijs [environment variable](https://docs.requarks.io/install/docker) documentation. For a working example, see this [homelab stack](https://github.com/bleetube/satstack).

## Example Playbook

```yaml
- hosts: wikijs
  roles:
    - role: nginxinc.nginx_core.nginx
      become: true
    - role: anxs.postgresql
      become: true
    - role: alvistack.podman
      become: true
    - role: bleetube.wikijs
      tags: wikijs
  tasks:
    - import_tasks: nginx_conf.yml
      become: true
```

## Systemd

```
systemctl --user status container-wikijs.service
```

## Upgrades

Configure `wikijs_version`.

```bash
ansible-playbook playbooks/wikijs.yml --tags wikijs
```

## Backups

See the [postgres example](docs/examples/postgres-backup.sh).
