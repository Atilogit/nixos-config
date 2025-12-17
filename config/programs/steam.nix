{ pkgs, ... }:
{
  # __GL_SHADER_DISK_CACHE_SKIP_CLEANUP=1 PROTON_ENABLE_WAYLAND=1 DXVK_HUD=compiler gamemoderun %command%
  programs.gamemode.enable = true;
  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [ proton-ge-bin ];
    remotePlay.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };
  environment.systemPackages = with pkgs; [
    heroic
  ];
}
