{
  self,
  inputs,
  lib,
  ...
}:
{
  flake.nixosModules.commonConfig =
    { ... }:
    {
      # Import all common modules
      imports = map (n: self.nixosModules.${n}) (
        map (lib.removeSuffix ".nix") (map baseNameOf ((inputs.import-tree.withLib lib).leafs ../common))
      );

      # Nix
      nixpkgs.config.allowUnfree = true;
      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];
      nix.optimise.automatic = true;

      # Network
      networking.networkmanager.enable = true;

      # Internationalisation properties
      time.timeZone = "Europe/Berlin";
      services.xserver.xkb.layout = "eu";
      i18n.defaultLocale = "de_DE.UTF-8";
      i18n.extraLocaleSettings = {
        LC_NUMERIC = "en_US.UTF-8";
      };
    };
}
