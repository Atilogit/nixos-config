{ pkgs, ... }:
{
  # PROTON_ENABLE_WAYLAND=1 DXVK_HUD=compiler gamemoderun %command%
  programs.gamemode.enable = true;
  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [ proton-ge-bin ];
  };
}
