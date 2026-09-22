{ ... }:
{
  flake.nixosModules.osu =
    # Mostly from https://git.dtth.ch/nki/nix-home/src/branch/master/home/osu/default.nix
    { pkgs, lib, ... }:
    let
      osu-script-inner = pkgs.writeShellScript "osu-script-inner" ''
        # test -n "$PIPEWIRE_ALSA" || export PIPEWIRE_ALSA='{ application.process.id='"$$"' alsa.channels=2 alsa.rate=44100 alsa.buffer-bytes=1024 alsa.period-bytes=128 }'
        # test -n "$PIPEWIRE_LATENCY" || export PIPEWIRE_LATENCY='1/44100'
        export SDL_VIDEODRIVER=x11
        export OSU_SDL3=1

        exec "$@"
      '';
      osu-script = pkgs.writeShellScript "osu-script" ''
        exec gamemoderun chrt -r 70 ${osu-script-inner} osu!
      '';
      osu-pkg =
        with pkgs;
        with lib;
        appimageTools.wrapType2 rec {
          pname = "osu-lazer-bin";
          version = "2026.921.0-lazer";
          src = fetchurl {
            url = "https://github.com/ppy/osu/releases/download/${version}/osu.AppImage";
            hash = "sha256-3O2UY7UBAJyV2+2JGr0vCswu+4TuQzb1scw7fASl/H0=";
            # hash = lib.fakeHash; # Use when updating
          };
          extraPkgs = pkgs: with pkgs; [ icu ];

          extraInstallCommands =
            let
              contents = appimageTools.extract { inherit pname version src; };
            in
            ''
              sed "s#osu!#$out/bin/${pname}#g" ${osu-script} > $out/bin/osu!
              chmod +x $out/bin/osu!
              install -m 444 -D ${contents}/osu\!.desktop -t $out/share/applications
              install -m 444 -D ${./mimetypes.xml} $out/share/mime/packages/${pname}.xml
              for i in 16 32 48 64 96 128 256 512 1024; do
                install -D ${contents}/osu.png $out/share/icons/hicolor/''${i}x$i/apps/osu.png
              done
            '';
        };
    in
    {
      environment.systemPackages = [ osu-pkg ];
      xdg.mime.defaultApplications."x-scheme-handler/osu" = "osu!.desktop";
      hardware.opentabletdriver.enable = true;
      hardware.opentabletdriver.daemon.enable = true;

      # https://xstarry.dev/firmware
      services.udev.extraRules = ''
        KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="056a", MODE="0660", GROUP="users", TAG+="uaccess"
        SUBSYSTEM=="usb", ATTR{idVendor}=="0ac3", MODE="0660", GROUP="users", TAG+="uaccess"
      '';
    };
}
