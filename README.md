# Personal NixOS configuration

## Overview

This system configuration aims to create a productive development environment
using open source tooling with minimal distractions. It is written with an
emphasis on being both portable and scalable, and many modules can be used
elsewhere with little to no modification. Home manager modules and nix modules
are automatically imported by the flake and are differentiated with the `h` or
`n` infix, delineating home manager modules and nix modules, respectively.

## Usage

Each machine requires a dedicated hardware configuration in order for NixOS to
understand how to utilize any given machine's hardware. This can be generated
with
`nixos-generate-config --show-hardware-config >  hardware-configuration.nix`.
