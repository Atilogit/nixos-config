{ ... }:
{
  flake.nixosModules.onlyoffice =
    { ... }:
    {
      home-manager.users.atilo.programs.onlyoffice = {
        enable = true;
        settings = {
          UITheme = "theme-night";
        };
      };
    };
}
