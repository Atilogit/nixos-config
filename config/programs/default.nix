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
    ffmpeg-full
    wl-clipboard
    file
    usbutils
    docker-compose
    android-tools # adb
    dix

    # GUI
    inkscape
    crosspipe
    (obsidian.override {
      commandLineArgs = "--ozone-platform=wayland --enable-features=WaylandWindowDecorations --enable-wayland-ime=true --enable-blink-features=MiddleClickAutoscroll";
    })
    krita
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
    musescore

    # Games
    archipelago
    mangohud
  ];

  programs.ausweisapp.enable = true;
  programs.ausweisapp.openFirewall = true;
}
