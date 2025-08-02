{ pkgs, ... }:
{
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    icu
    fontconfig

    xorg.libX11
    xorg.libICE
    xorg.libSM
  ];
}
