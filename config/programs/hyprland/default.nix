{ pkgs, ... }:
{
  # https://wiki.hypr.land/Nix/Hyprland-on-Home-Manager/
  programs.hyprland = {
    enable = true;
  };
  home-manager.users.atilo.wayland.windowManager.hyprland = {
    enable = true;
    systemd.variables = [ "--all" ];
    # Combine all files from ./config into one
    extraConfig = builtins.concatStringsSep "\n" (
      map (f: builtins.readFile ./config/${f}) (builtins.attrNames (builtins.readDir ./config))
    );
    # set the Hyprland and XDPH packages to null to use the ones from the NixOS module
    package = null;
    portalPackage = null;

    plugins = with pkgs.hyprlandPlugins; [
      hyprsplit
    ];
  };
}
