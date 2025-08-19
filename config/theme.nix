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
      iconTheme = {
        name = "Fluent-dark";
        package = pkgs.fluent-icon-theme;
      };
    };
  };

  qt = {
    enable = true;
  };

  stylix.enable = true;
  home-manager.users.atilo.stylix.targets.zed.enable = false; # Doesn't look good

  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";
  stylix.image = ../assets/wallpaper.png;
  stylix.polarity = "dark";

  # Config
  stylix.fonts = {
    monospace = {
      package = pkgs.nerd-fonts.fira-code;
      name = "FiraCode Nerd Font";
    };
    sizes = {
      applications = 10.65;
      desktop = 9;
    };
  };
  stylix.opacity = {
    desktop = 0.8;
    applications = 0.8;
    terminal = 0.8;
    popups = 0.8;
  };
}
