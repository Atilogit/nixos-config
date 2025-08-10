{ pkgs, ... }:
{
  programs.direnv.enable = true;
  environment.systemPackages = with pkgs; [
    # General
    wget
    ncdu
    unzip
    zip
    btop
    fastfetch
    tokei
    vulkan-tools
    inotify-tools
    ffmpeg
    wl-clipboard

    # GUI
    spotify
    audacity
    mission-center # task manager
    decibels # audio player
    loupe # image viewer
    vlc
    tracy # profiler
    rnote
    anytype
    (blender.override { cudaSupport = true; })

    # Games
    archipelago
    mangohud
  ];
}
