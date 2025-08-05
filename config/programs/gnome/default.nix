{ lib, pkgs, ... }:
{
  services.displayManager.gdm = {
    enable = false; # Set to true if actually using gnome
    autoSuspend = false;
  };
  # Start with `gnome-shell --wayland`
  services.desktopManager.gnome.enable = true;
  environment.gnome.excludePackages = [
    pkgs.gnome-tour
    pkgs.gnome-user-docs
    pkgs.gnome-text-editor
    pkgs.gnome-calendar
    pkgs.gnome-console
    pkgs.gnome-contacts
    pkgs.gnome-maps
    pkgs.gnome-music
    pkgs.gnome-system-monitor
    pkgs.gnome-weather
    pkgs.gnome-connections # Remote desktop
    pkgs.epiphany # Browser
    pkgs.snapshot # Camera
    pkgs.totem # Video player
    pkgs.yelp # Help
    pkgs.evince # PDF viewer
    pkgs.geary # Email
  ];
  programs.dconf.profiles.user.databases = [
    {
      lockAll = true;
      settings = {
        "org/gnome/desktop/interface" = {
          gtk-enable-primary-paste = false;
        };
        "org/gnome/settings-daemon/plugins/color" = {
          night-light-enabled = false;
          night-light-schedule-automatic = false;
          night-light-schedule-from = 22.0;
          night-light-schedule-to = 7.0;
          night-light-temperature = lib.gvariant.mkUint32 2700;
        };
        "org/gnome/desktop/peripherals/mouse" = {
          accel-profile = "flat";
          speed = -0.75;
        };
        "org/gnome/mutter" = {
          edge-tiling = false;
          experimental-features = [
            "scale-monitor-framebuffer"
            "variable-refresh-rate"
            "xwayland-native-scaling"
          ];
        };

        # Keybinds
        "org/gnome/settings-daemon/plugins/media-keys" = {
          custom-keybindings = [
            "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/terminal/"
          ];
        };
        "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/terminal" = {
          binding = "<Super>x";
          command = "alacritty";
          name = "Terminal";
        };
        "org/gnome/desktop/wm/keybindings" = {
          switch-applications = lib.gvariant.mkEmptyArray lib.gvariant.type.string;
          switch-applications-backward = lib.gvariant.mkEmptyArray lib.gvariant.type.string;
          switch-windows = [ "<Alt>Tab" ];
          switch-windows-backward = [ "<Shift><Alt>Tab" ];
          close = [ "<Super>BackSpace" ];
        };
      };
    }
  ];
}
