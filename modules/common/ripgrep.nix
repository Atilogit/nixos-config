{ ... }:
{
  flake.nixosModules.ripgrep =
    { ... }:
    {
      home-manager.sharedModules = [
        (
          { ... }:
          {
            programs.ripgrep = {
              enable = true;
              arguments = [
                "--smart-case"
                "--no-messages"
              ];
            };
          }
        )
      ];
    };
}
