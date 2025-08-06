{ pkgs, ... }:
{
  home-manager.users.atilo = {
    home.pointerCursor = {
      gtk.enable = true;
      hyprcursor.enable = true;
      x11.enable = true;
      package = pkgs.vimix-cursors;
      name = "Vimix-white-cursors";
      size = 24;
    };

    gtk = {
      enable = true;
      theme = {
        name = "Flat-Remix-GTK-Grey-Dark";
        package = pkgs.flat-remix-gtk;
      };
      iconTheme = {
        name = "Fluent-dark";
        package = pkgs.fluent-icon-theme;
      };
    };
  };

  programs.dconf.profiles.user.databases = [
    {
      lockAll = true;
      settings = {
        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
        };
        "org/gnome/shell/extensions/user-theme" = {
          name = "Flat-Remix-GTK-Grey-Dark";
        };
      };
    }
  ];

  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita-dark";
  };
}
