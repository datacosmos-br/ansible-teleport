# Ansible Role: Teleport Node Service

An ansible role to install or update the teleport node service and teleport config using native packages (RPM and DEB).

If you add your own teleport config file template you can run any node services you want (ssh, app, database, kubernetes)

## Requirements

A running teleport cluster so that you can provide the following information:

- auth token (dynamic or static) and CA pin or
- EC2 join token (see: [documentation](https://goteleport.com/docs/setup/guides/joining-nodes-aws/))
- address of the authentication server

## Role Variables

Variables with their default values as defined in `defaults/main.yml`

```sh
teleport_config_template: "default_teleport.yaml.j2"
```

The template to use for the teleport configuration file. The default is `templates/default_teleport.yaml.j2`. It contains a basic configuration that will enable the SSH service and add a command label showing node uptime.

There are many [options available](https://goteleport.com/docs/setup/reference/config/) and you can substitute in your own template and add any variables you want. We also ship template `templates/ec2_teleport.yaml.j2` using automatic node join with [ec2 tokens](https://goteleport.com/docs/setup/guides/joining-nodes-aws/).

```sh
teleport_ca_pin: ''
```

The CA pin to use for the teleport configuration. This is optional, but [recommended](https://goteleport.com/docs/setup/admin/adding-nodes/#untrusted-auth-servers).

```sh
teleport_config_path: "/etc/teleport.yaml"
```

The path to the teleport configuration file.

```sh
teleport_auth_servers
```

The list of authentication servers to use for the teleport configuration. Examples are shown as defaults above.

```sh
teleport_backup_config: true

```

Runs a backup of the teleport configuration file before overwriting it.

## Dependencies

None

## Example Playbook

For example to install teleport using EC2 join method:

```yaml
- hosts: all
  roles:
    - zen.teleport
```

*Inside `group_vars/all.yaml`*

```yaml
teleport_config_template: ec2_teleport.yaml.j2
teleport_auth_servers:
  - https://teleport.company.cc:443
teleport_ec2_join_token: ec2-teleport-join-token
teleport_host_labels:
  owner: zen
  type: standalone
```

## License

MIT / BSD

## Author Information

This role was created in 2021 by Matthew Draws, forked, completely rewritten and adapted for EL based systems and using packages by Tomasz 'Zen' Napierala in 2022.
