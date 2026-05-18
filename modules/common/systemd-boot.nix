{ ... }:
{
  flake.nixosModules.systemd-boot =
    { ... }:
    {
      boot.loader.systemd-boot.enable = true;
      # Prevent /boot from running out of space
      boot.loader.systemd-boot.configurationLimit = 10;
      boot.loader.efi.canTouchEfiVariables = true;
      boot.loader.timeout = 2;
    };
}
