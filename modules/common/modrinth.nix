{ ... }:
{
  flake.nixosModules.modrinth =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        modrinth-app
      ];
    };
}
