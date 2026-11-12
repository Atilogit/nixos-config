{ ... }:
{
  flake.nixosModules.cups =
    { ... }:
    {
      services.printing.enable = true;
      hardware.sane.enable = true;
    };
}
