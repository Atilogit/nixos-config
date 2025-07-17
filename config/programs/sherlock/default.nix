{ pkgs, config, ... }:
{
  environment.systemPackages = with pkgs; [
    sherlock-launcher
  ];

  # Inspired by
  # https://github.com/nix-community/home-manager/blob/f5098b074051d1ae0e919adf434a60fc3f23347b/modules/programs/hyprpanel/default.nix#L99
  home-manager.users.atilo.systemd.user.services.sherlock =
    let
      cfg = config.home-manager.users.atilo;
    in
    {
      Unit = {
        Description = "A lightweight and efficient application launcher built with Rust and GTK4";
        Documentation = "https://github.com/Skxxtz/sherlock";
        PartOf = [ cfg.wayland.systemd.target ];
        After = [ cfg.wayland.systemd.target ];
        ConditionEnvironment = "WAYLAND_DISPLAY";
      };
      Service = {
        ExecStart = "${pkgs.sherlock-launcher}/bin/sherlock --daemonize";
        Restart = "on-failure";
        KillMode = "mixed";
      };
      Install = {
        WantedBy = [ cfg.wayland.systemd.target ];
      };
    };

  # Config
  home-manager.users.atilo.home.file.".config/sherlock/config.toml" = {
    enable = true;
    source = ./config.toml;
  };
  home-manager.users.atilo.home.file.".config/sherlock/fallback.json" = {
    enable = true;
    source = ./fallback.json;
  };
  home-manager.users.atilo.home.file.".config/sherlock/sherlock_alias.json" = {
    enable = true;
    source = ./sherlock_alias.json;
  };

  # Empty files to satisfy warnings
  home-manager.users.atilo.home.file.".config/sherlock/main.css" = {
    enable = true;
    text = "";
  };
  home-manager.users.atilo.home.file.".config/sherlock/sherlock_actions.json" = {
    enable = true;
    text = "[]";
  };
  home-manager.users.atilo.home.file.".config/sherlock/sherlockignore" = {
    enable = true;
    text = "";
  };
}
