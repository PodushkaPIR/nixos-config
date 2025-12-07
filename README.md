# NixOS config

Base nixos config with home-manager, flake.

## Installation
1. **Clone the Repository**
```bash
git clone https://github.com/PodushkaPIR/nixos-config
```
2. **Rename and Remove**
```bash
cd hosts
cp -r nixos-btw <hostname>
```
3. **Rebuild**
```bash
cd nixos-config
sudo nixos-rebuild switch --flake .#<hostname>
nix run home-manager -- switch --flake .#<username>
```
