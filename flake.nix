{
  description = "Atilo's config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    chaotic.inputs.home-manager.follows = "home-manager";
    chaotic.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      chaotic,
      ...
    }@inputs:
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit self inputs; };
        modules =
          # Import all nix files from subdirectories
          let
            listFilesRecursive =
              path:
              let
                entries = nixpkgs.lib.filterAttrs (
                  name: type:
                  ((nixpkgs.lib.hasSuffix ".nix" name) || type == "directory") && !(nixpkgs.lib.hasPrefix "_" name)
                ) (builtins.readDir path);
                files = builtins.attrNames entries;
              in
              builtins.concatLists (
                builtins.map (
                  name:
                  let
                    fullPath = path + "/${name}";
                  in
                  if entries.${name} == "directory" then listFilesRecursive fullPath else [ fullPath ]
                ) files
              );
          in
          (nixpkgs.lib.filter (p: p != ./flake.nix) (listFilesRecursive ./.))
          ++ [
            home-manager.nixosModules.home-manager
            chaotic.nixosModules.default
          ];
      };
    };
}
