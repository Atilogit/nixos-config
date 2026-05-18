{ ... }:
{
  flake.nixosModules.ausweisapp =
    { ... }:
    {
      programs.ausweisapp.enable = true;
      programs.ausweisapp.openFirewall = true;
    };
}
