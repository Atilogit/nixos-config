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
        name = "Fluent-round-Dark";
        package = pkgs.fluent-gtk-theme.override {
          tweaks = [
            "square"
            "blur"
            "round"
          ];
        };
      };
      iconTheme = {
        name = "Fluent-dark";
        package = pkgs.fluent-icon-theme;
      };
    };
  };

  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita-dark";
  };
}
