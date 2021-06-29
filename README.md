# Nix and HomeManager Config for Non-Nixos systems

## Steps on WSL

```

curl -L https://nixos.org/nix/install | sh # Install Nix
nix-env -f '<nixpkgs>' -iA nixUnstable # Install Nix unstable
NIX_UNSTABLE=$(which nix) # save the path

nix-env -e nix # remove Nix stable
mkdir -p ~/.config/nix echo 'experimental-features = nix-command flakes # enable flakes commands

nix build .#homeManagerConfigurations.linux.activationPackage && ./result/activate # create HomeManager config and activate it
```
