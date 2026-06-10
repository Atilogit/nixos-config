{ ... }:
{
  flake.nixosModules.discord =
    { pkgs, ... }:
    {
      home-manager.sharedModules = [
        (
          { ... }:
          {
            programs.discord = {
              enable = true;
              package = (
                pkgs.discord-canary.override {
                  # withOpenASAR = true; # Causes "Installing update 13 out of 12`"
                  withVencord = true;
                  enableAutoscroll = true;
                }
              );
              configName = "discordcanary";
            };
          }
        )
      ];
    };
}
