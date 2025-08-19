{ ... }:
{
  programs.dconf.profiles.user.databases = [
    {
      lockAll = true;
      settings = {
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
