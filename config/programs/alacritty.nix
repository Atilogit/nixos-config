{ ... }:
{
  home-manager.users.atilo.programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 0.8;
      scrolling.history = 100000;
      font.normal.family = "FiraCode Nerd Font";
      selection.save_to_clipboard = true;
      keyboard.bindings = [
        {
          key = "V";
          mods = "Control";
          action = "Paste";
        }
      ];
    };
    theme = "one_dark";
  };
}
