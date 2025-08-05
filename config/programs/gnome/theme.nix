{ ... }:
let
  background = ../../../assets/wallpaper.png;
in
{
  programs.dconf.profiles.user.databases = [
    {
      lockAll = true;
      settings = {
        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
        };
        "org/gnome/shell/extensions/user-theme" = {
          name = "Fluent-round-Dark";
        };
        "org/gnome/desktop/background" = {
          picture-options = "spanned";
          picture-uri = "file://" + (toString background);
          picture-uri-dark = "file://" + (toString background);
        };
        "org/gnome/desktop/screensaver" = {
          picture-options = "spanned";
          picture-uri = "file://" + (toString background);
        };
        "org/gnome/desktop/wm/preferences" = {
          button-layout = "appmenu:minimize,maximize,close";
          action-double-click-titlebar = "toggle-maximize";
          action-middle-click-titlebar = "none";
          action-right-click-titlebar = "menu";
          resize-with-right-button = true;
        };
      };
    }
  ];
}
