{ ... }:
{
  flake.nixosModules.discord =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        (discord-canary.override {
          withOpenASAR = true;
          # withVencord = true;
          enableAutoscroll = true;
        })
      ];
    };
}
