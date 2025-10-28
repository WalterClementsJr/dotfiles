# Dotfiles

This repo contains the configuration to setup my Linux machines.

## Requirement

This automated setup is currently only test and configured on Fedora machines.

## How to run

```shell
export GITHUB_USERNAME=walterclementsjr
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply $GITHUB_USERNAME
```
