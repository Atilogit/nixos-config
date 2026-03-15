{ pkgs, ... }:
{
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    icu
    fontconfig

    libx11
    libice
    libsm
    libxext
    libxrender
    libxtst
    libxi
  ];
}
