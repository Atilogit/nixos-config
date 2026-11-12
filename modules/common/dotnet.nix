{ ... }:
{
  flake.nixosModules.dotnet =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.dotnet-sdk_10
      ];
      environment.etc."dotnet/install_location_x64".text = "${pkgs.dotnet-sdk_10}/share/dotnet";
    };
}
