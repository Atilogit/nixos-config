generations=($(ls -v /nix/var/nix/profiles/))
prev_path="/nix/var/nix/profiles/${generations[-2]}"
nix run nixpkgs#dix -- ${prev_path} /nix/var/nix/profiles/system
