{ ... }:
{
  flake.nixosModules.activitywatch =
    { pkgs, ... }:
    {
      services.activitywatch = {
        enable = true;
      };
    };
}
