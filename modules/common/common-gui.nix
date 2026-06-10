{ ... }:
{
  flake.nixosModules.common-gui =
    { pkgs, ... }:
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
        anytype
        (blender.override { cudaSupport = true; })
        musescore
        mangohud

        # Gnome
        xdg-user-dirs
        xdg-user-dirs-gtk

        baobab # Graphical application to analyse disk usage in any GNOME environment
        decibels # Play audio files
        gnome-calculator
        gnome-calendar
        gnome-characters
        gnome-clocks
        gnome-console
        gnome-contacts
        gnome-font-viewer
        gnome-logs
        gnome-maps
        gnome-music
        gnome-system-monitor
        gnome-weather
        loupe # Image viewer
        nautilus # File manager for GNOME
        papers
        gnome-connections
        showtime # Video player
        simple-scan
        snapshot
        yelp # Help viewer for GNOME

        dconf-editor
        devhelp
        d-spy
        gnome-boxes # https://github.com/NixOS/nixpkgs/issues/60908
        sysprof
      ];

      services.orca.enable = true;
      programs.gnome-disks.enable = true;
      programs.seahorse.enable = true;
      services.gnome.sushi.enable = true; # TODO try
      services.sysprof.enable = true;

      # For nautilus
      services.gvfs.enable = true;
      programs.nautilus-open-any-terminal = {
        enable = true;
        terminal = "alacritty";
      };
    };
}
