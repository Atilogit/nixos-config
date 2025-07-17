{ ... }:
{
  # Nix
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nix.optimise.automatic = true;

  # Home-manager
  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true; # Install packages to /etc/profiles instead of $HOME/.nix-profile
  home-manager.backupFileExtension = "old"; # Use same pkgs as os config

  # General
  time.timeZone = "Europe/Berlin";

  # Version
  system.stateVersion = "25.05";
  home-manager.users.atilo.home.stateVersion = "25.05";
}
