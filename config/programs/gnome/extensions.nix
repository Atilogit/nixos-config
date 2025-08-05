{ pkgs, lib, ... }:
let
  extensions = with pkgs.gnomeExtensions; [
    blur-my-shell
    clipboard-indicator
    gsconnect
    removable-drive-menu
    astra-monitor
    fuzzy-app-search
    appindicator
    tiling-shell
    user-themes
    advanced-alttab-window-switcher
  ];
in
{
  environment.systemPackages =
    with pkgs;
    extensions
    ++ [
      # For astra-monitor
      pciutils
      nethogs
      iw
      iotop
      gtop
    ];
  programs.dconf.profiles.user.databases = [
    {
      lockAll = true;
      settings = {
        "org/gnome/shell" = {
          disable-user-extensions = false;
          enabled-extensions = map (e: e.extensionUuid) extensions;
        };
        "org/gnome/shell/extensions/blur-my-shell/applications" = {
          blur = true;
          enable-all = true;
          dynamic-opacity = false; # Blur active window
          opacity = lib.gvariant.mkInt32 255;
        };
        "org/gnome/shell/extensions/appindicator" = {
          icon-opacity = lib.gvariant.mkInt32 255;
          icon-size = lib.gvariant.mkInt32 20;
        };
        "org/gnome/shell/extensions/clipboard-indicator" = {
          preview-size = lib.gvariant.mkInt32 50;
          move-item-first = true;
          keep-selected-on-clear = true;
          paste-button = false;
        };
        "org/gnome/shell/extensions/tilingshell" = {
          enable-autotiling = true;
          enable-span-multiple-tiles = false;
          enable-window-border = true;
          focus-window-down = [ "<Super>Down" ];
          focus-window-left = [ "<Super>Left" ];
          focus-window-right = [ "<Super>Right" ];
          focus-window-up = [ "<Super>Up" ];
          inner-gaps = lib.gvariant.mkUint32 8;
          move-window-down = [ "<Control><Super>Down" ];
          move-window-left = [ "<Control><Super>Left" ];
          move-window-right = [ "<Control><Super>Right" ];
          move-window-up = [ "<Control><Super>Up" ];
          tiling-system-activation-key = [ "2" ];
          top-edge-maximize = true;
          window-border-width = lib.gvariant.mkUint32 1;

          layouts-json = ''[{"id":"Layout 3","tiles":[{"x":0,"y":0,"width":0.33,"height":1,"groups":[1]},{"x":0.33,"y":0,"width":0.67,"height":1,"groups":[1]}]},{"id":"Layout 4","tiles":[{"x":0,"y":0,"width":0.67,"height":1,"groups":[1]},{"x":0.67,"y":0,"width":0.33,"height":1,"groups":[1]}]},{"id":"1300925","tiles":[{"x":0,"y":0,"width":0.5,"height":1,"groups":[1]},{"x":0.5,"y":0,"width":0.5,"height":1,"groups":[1]}]},{"id":"1353976","tiles":[{"x":0,"y":0,"width":1.0,"height":0.5,"groups":[1]},{"x":0,"y":0.5,"width":1.0,"height":0.5,"groups":[1]}]}]'';
        };
        "org/gnome/shell/extensions/advanced-alt-tab-window-switcher" = {
          switcher-popup-preview-selected = lib.gvariant.mkInt32 2;
          switcher-popup-timeout = lib.gvariant.mkInt32 0;
          win-switcher-popup-filter = lib.gvariant.mkInt32 1;
          win-switcher-popup-preview-size = lib.gvariant.mkInt32 192;
          win-switcher-popup-search-apps = false;
        };
      };
    }
  ];
}
