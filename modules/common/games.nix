{ ... }:
{
  flake.nixosModules.games =
    { pkgs, ... }:
    {
      programs.steam = {
        enable = true;
        extraCompatPackages = with pkgs; [ proton-ge-bin ];
        remotePlay.openFirewall = true;
        localNetworkGameTransfers.openFirewall = true;
      };
      environment.systemPackages = with pkgs; [
        heroic
      ];

      programs.gamemode.enable = true;
      programs.gamescope = {
        enable = true;
        # capSysNice = true; # TODO
      };

      # TODO proton environment vars
    };
}
