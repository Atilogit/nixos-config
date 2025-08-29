{ ... }:
{
  home-manager.users.atilo.programs.ghostty = {
    enable = true;
    settings = {
      scrollback-limit = 10000000; # 10MB
      copy-on-select = "clipboard"; # System clipboard
      # term = "xterm-ghostty";
      keybind = "ctrl+v=paste_from_clipboard";
      app-notifications = "no-clipboard-copy";
    };
  };
}
