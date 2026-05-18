{ self, inputs, ... }:
{
  flake.nixosModules.alacritty =
    { pkgs, ... }:
    {
      environment.systemPackages = [ self.packages.${pkgs.stdenv.hostPlatform.system}.alacritty ];
    };
  perSystem =
    { ... }:
    {
      packages.alacritty = inputs.wrapper-modules.wrappers.alacritty.wrap {
        settings = {
          scrolling.history = 100000;
          selection.save_to_clipboard = true;
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
