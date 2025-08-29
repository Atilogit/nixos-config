{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.caskaydia-cove
    nerd-fonts.space-mono
    nerd-fonts.jetbrains-mono
    font-awesome_6
    noto-fonts
    rubik
    material-symbols
  ];
}
