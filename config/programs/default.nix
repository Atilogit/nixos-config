{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # General
    wget
    ncdu
    unzip
    btop
    fastfetch
    tokei
    vulkan-tools

    # GUI
    vesktop
    spotify
    audacity
    mission-center # task manager
    decibels # audio player
    loupe # image viewer
    vlc
    tracy # profiler
    rnote
    anytype

    # Games
    archipelago
    mangohud
  ];
}
