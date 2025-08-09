{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    (discord-canary.override {
      withOpenASAR = true;
      withVencord = true;
      enableAutoscroll = true;
    })
  ];

  home-manager.users.atilo.home.file.".config/Vencord/settings/quickCss.css" = {
    enable = true;
    source = ./quickCss.css;
  };
  home-manager.users.atilo.home.file.".config/Vencord/settings/settings.json" = {
    enable = true;
    source = ./settings.json;
  };
}
