{ self, inputs, ... }:
{
  flake.nixosModules.alacritty =
    { pkgs, ... }:
    {
      environment.systemPackages = [ self.packages.${pkgs.stdenv.hostPlatform.system}.alacritty ];
      fonts.packages = with pkgs; [ nerd-fonts.fira-code ];
    };
  perSystem =
    { pkgs, ... }:
    {
      packages.alacritty = inputs.wrapper-modules.wrappers.alacritty.wrap {
        inherit pkgs;
        settings = {
          scrolling.history = 100000;
          selection.save_to_clipboard = true;
          window = {
            dynamic_padding = true;
            opacity = 0.8;
            blur = true;
          };
          font = {
            normal = {
              family = "FiraCode Nerd Font";
            };
            size = 10.65;
          };
          cursor.style = {
            shape = "Beam";
            blinking = "On";
          };
          general.import = [ "${pkgs.alacritty-theme}/share/alacritty-theme/one_dark.toml" ];
          keyboard.bindings = [
            {
              key = "V";
              mods = "Control";
              action = "Paste";
            }
          ];
        };
      };
    };
}

# TODO:
# Scrollbar
