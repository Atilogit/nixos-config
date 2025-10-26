{ pkgs, lib, ... }:
{
  # Reduce blue light
  home-manager.users.atilo.services.wlsunset = {
    enable = true;
    latitude = 48.9;
    longitude = 9.1;
    temperature.night = 3000;
  };
  systemd.services.wlsunset-resume = {
    unitConfig = {
      Description = "Restart wlsunset on resume";
      After = [ "suspend.target" ];
    };
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "systemctl --user --machine=atilo@.host restart wlsunset.service";
    };
    wantedBy = [ "suspend.target" ];
  };

  # Bar

  # Wallpaper

  environment.systemPackages = with pkgs; [
    hyprpicker # Color picker
    hyprshot # Screenshot
    socat # Used in scripts
  ];
}
