{ ... }:
{
  flake.nixosModules.osu =
    # Mostly from https://git.dtth.ch/nki/nix-home/src/branch/master/home/osu/default.nix
    { pkgs, lib, ... }:
    let
      osu-pkg =
        with pkgs;
        with lib;
        appimageTools.wrapType2 rec {
          pname = "osu-lazer-bin";
          version = "2026.429.0-lazer";
          src = fetchurl {
            url = "https://github.com/ppy/osu/releases/download/${version}/osu.AppImage";
            hash = "sha256-3yBDCMffgWQKmBHETYl7IrvT5BOE6vN+sH8dGg+w//s=";
            # hash = lib.fakeHash; # Use when updating
          };
          extraPkgs = pkgs: with pkgs; [ icu ];

          extraInstallCommands =
            let
              contents = appimageTools.extract { inherit pname version src; };
            in
            ''
              mv -v $out/bin/${pname} $out/bin/osu\!
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
    };
}
