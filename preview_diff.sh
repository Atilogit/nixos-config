set -e
cd /home/atilo/nix
nixos-rebuild build --flake .
nix run nixpkgs#dix -- /nix/var/nix/profiles/system result
rm result
