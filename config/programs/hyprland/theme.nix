{ pkgs, ... }:
{
  home-manager.users.atilo = {
    home.pointerCursor = {
      gtk.enable = true;
      hyprcursor.enable = true;
      x11.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };

    gtk = {
      enable = true;
      theme = {
        name = "Adwaita";
      };
      iconTheme = {
        package = pkgs.adwaita-icon-theme;
        name = "Adwaita";
      };
      font = {
        name = "Noto Sans Medium";
        size = 11;
      };
    };

    qt = {
      enable = true;
      style.package = pkgs.adwaita-qt;
      style.name = "adwaita-dark";
    };
  };
}
