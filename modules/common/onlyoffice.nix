{ ... }:
{
  flake.nixosModules.onlyoffice =
    { ... }:
    {
      home-manager.sharedModules = [
        (
          { ... }:
          {
            programs.onlyoffice = {
              enable = true;
              settings = {
                UITheme = "theme-night";
              };
            };
          }
        )
      ];
    };
}
