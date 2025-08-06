{ pkgs, ... }:
{
  # https://wiki.hypr.land/Nix/Hyprland-on-Home-Manager/
  programs.hyprland.enable = true;
  home-manager.users.atilo.wayland.windowManager.hyprland = {
    enable = true;
    systemd.variables = [ "--all" ];
    # Combine all files from ./config into one
    extraConfig = builtins.concatStringsSep "\n" (
      builtins.map (f: builtins.readFile ./config/${f}) (builtins.attrNames (builtins.readDir ./config))
    );
    plugins = with pkgs.hyprlandPlugins; [
      hyprsplit
      hyprspace
    ];
  };
}
