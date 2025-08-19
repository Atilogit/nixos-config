{ ... }:
{
  home-manager.users.atilo.programs.alacritty = {
    enable = true;
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
}
