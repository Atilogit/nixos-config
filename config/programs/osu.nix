# Mostly from https://git.dtth.ch/nki/nix-home/src/branch/master/home/osu/default.nix
{ pkgs, lib, ... }:
let
  osu-pkg =
    with pkgs;
    with lib;
    appimageTools.wrapType2 rec {
      pname = "osu-lazer-bin";
      version = "2025.702.0-tachyon";
      src = fetchurl {
        url = "https://github.com/ppy/osu/releases/download/${version}/osu.AppImage";
        hash = "sha256-qlL6SZRITpTzur96Ge4AZmxH5pnd6tnuDIm6enppVu4=";
      };
      extraPkgs = pkgs: with pkgs; [ icu ];

      extraInstallCommands =
        let
          contents = appimageTools.extract { inherit pname version src; };
        in
        ''
          mv -v $out/bin/${pname} $out/bin/osu\!
          install -m 444 -D ${contents}/osu\!.desktop -t $out/share/applications
          for i in 16 32 48 64 96 128 256 512 1024; do
            install -D ${contents}/osu.png $out/share/icons/hicolor/''${i}x$i/apps/osu.png
          done
        '';
    };
in
{
  environment.systemPackages = [ osu-pkg ];
  hardware.opentabletdriver.enable = true;
  hardware.opentabletdriver.daemon.enable = false;
}
