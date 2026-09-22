{ ... }:
{
  flake.nixosModules.common-gui =
    { pkgs, pkgs-stable, ... }:
    {
      environment.systemPackages = with pkgs; [
        inkscape
        crosspipe
        (obsidian.override {
          commandLineArgs = "--ozone-platform=wayland --enable-features=WaylandWindowDecorations --enable-wayland-ime=true --enable-blink-features=MiddleClickAutoscroll";
        })
        krita
        spotify
        audacity
        mission-center # task manager
        vlc
        tracy # profiler
        rnote
        (pkgs-stable.blender.override { cudaSupport = true; })
        musescore
        mangohud
        renderdoc
        handy # Voice to text
        kdePackages.filelight # Really fast disk usage

        # Gnome
        xdg-user-dirs
        xdg-user-dirs-gtk

        decibels # Play audio files
        gnome-clocks
        gnome-contacts
        gnome-logs
        gnome-maps
        loupe # Image viewer
        nautilus # File manager for GNOME
        papers
        gnome-connections # Remote desktop
        simple-scan
        snapshot # Camera
        yelp # Help viewer for GNOME

        dconf-editor
        devhelp
        d-spy
        gnome-boxes # https://github.com/NixOS/nixpkgs/issues/60908
        sysprof # Profiler
      ];

      services.orca.enable = true; # Barcode scanner
      programs.gnome-disks.enable = true; # Partition manager
      programs.seahorse.enable = true; # Trust store
      services.sysprof.enable = true;

      # For nautilus
      services.gvfs.enable = true;
      programs.nautilus-open-any-terminal = {
        enable = true;
        terminal = "alacritty";
      };
    };
}
