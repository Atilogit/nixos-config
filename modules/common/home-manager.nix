{ inputs, ... }:
{
  flake.nixosModules.home-manager =
    { config, ... }:
    {
      imports = [
        inputs.home-manager.nixosModules.default
      ];

      home-manager = {
        # Use same pkgs as os config
        useGlobalPkgs = true;
        # Install packages to /etc/profiles instead of $HOME/.nix-profile
        useUserPackages = true;
        backupFileExtension = "old";
        sharedModules = [
          (
            { ... }:
            {
              home.stateVersion = config.system.stateVersion;
            }
          )
        ];
      };
    };
}
