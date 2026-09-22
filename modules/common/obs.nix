{ ... }:
{
  flake.nixosModules.obs =
    { pkgs-stable, ... }:
    {
      programs.obs-studio = {
        enable = true;
        enableVirtualCamera = true;
        package = pkgs-stable.obs-studio.override { cudaSupport = true; };
      };
    };
}
