# PostgreSQL

This variation of the [original role](https://github.com/Tronde/ansible_role_deploy_wikijs_with_mariadb_pod) is intended to be composed with another role that sets up the database. Here is an example using [anxs.postgresql](https://github.com/ANXS/postgresql)

## Example Playbook

```yaml
  roles:
    - anxs.postgresql
```

## Example Variables

```yaml
postgresql_users:
  - name: wikijs
    pass: "{{ lookup('ansible.builtin.env', 'WIKIJS_POSTGRES_PASSWORD') }}"
    encrypted: yes
    state: present

postgresql_databases:
  - name: wikijs
    owner: wikijs
    state: present
```
