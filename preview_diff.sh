set -e
cd /home/atilo/nix
nix run nixpkgs#nh -- os build .
rm result
