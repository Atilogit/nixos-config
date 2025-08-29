{
  description = "Atilo's config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager.url = "github:nix-community/home-manager?ref=master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    chaotic.url = "github:chaotic-cx/nyx?rev=b342f1adfa040963c9b00f4f1755def9f8588a58";
    chaotic.inputs.home-manager.follows = "home-manager";
    chaotic.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:danth/stylix?ref=master";
    stylix.inputs.nixpkgs.follows = "nixpkgs";

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
  };

  outputs =
    {
      self,
      nixpkgs,
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
            inputs.home-manager.nixosModules.home-manager
            inputs.chaotic.nixosModules.default
            inputs.stylix.nixosModules.stylix
            inputs.nix-flatpak.nixosModules.nix-flatpak
          ];
      };
    };
}
