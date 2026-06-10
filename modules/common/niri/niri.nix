{ self, inputs, ... }:
{
  flake.nixosModules.niri =
    { pkgs, ... }:
    {
      programs.niri = {
        enable = true;
        package = self.packages.${pkgs.stdenv.hostPlatform.system}.niri;
      };

      # Theming
      home-manager.sharedModules = [
        (
          { ... }:
          {
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

            qt = {
              enable = true;
              platformTheme.name = "adwaita";
              style.name = "adwaita-dark";
            };
          }
        )
      ];
      environment.systemPackages = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-gnome
        gnome-keyring
      ];
    };
  perSystem =
    {
      pkgs,
      lib,
      ...
    }:
    {
      packages.niri = inputs.wrapper-modules.wrappers.niri.wrap {
        inherit pkgs;
        settings = {
          xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;
        };
        extraSettings = [
          { include = ./config.kdl; }
          { include = ./theme.kdl; }
          { include = ./binds_default.kdl; }
          { include = ./binds_user.kdl; }
          { include = ./binds_noctalia.kdl; }
          {
            include = [
              { optional = true; }
              "~/.config/niri/dynamic.kdl"
            ];
          }
        ];
      };
    };
}
