<p align="center"><img align="center" src="logo.png" width="370px"></p>
---
## Overview

ZorrOS is a high level NixOS configuration which aims to create a productive
development environment with open source tooling and minimal distractions. It is
written with emphasis on being both portable and scalable - many modules can be
used elsewhere with little or no modification. Home manager modules and nix
modules are automatically imported by the flake and are differentiated with the
`h` or `n` infix which respectively delineate home manager modules and nix
modules.

## Usage

Every machine requires a dedicated hardware configuration in order for the OS to
properly utilize its hardware. This can be generated from the cli with
`nixos-generate-config --show-hardware-config >  hardware-configuration.nix`.

## Overview of Specific Choices

### Networking

[NetworkManager](https://www.networkmanager.dev) was chosen over the default
wpa_supplicant as it is both simpler to configure and has a wider feature set.

### Authentication
