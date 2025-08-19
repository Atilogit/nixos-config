{
  description = "Atilo's config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?rev=c2ae88e026f9525daf89587f3cbee584b92b6134"; # nixos-unstable

    home-manager.url = "github:nix-community/home-manager?rev=cc2fa2331aebf9661d22bb507d362b39852ac73f";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    chaotic.url = "github:chaotic-cx/nyx?rev=b342f1adfa040963c9b00f4f1755def9f8588a58";
    chaotic.inputs.home-manager.follows = "home-manager";
    chaotic.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:danth/stylix?rev=9810b32b9b7520e3b37358ff8e793fb5034c3299";
    stylix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      chaotic,
      stylix,
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
            stylix.nixosModules.stylix
          ];
      };
    };
}
