{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.caskaydia-cove
    font-awesome_6
    noto-fonts
  ];
}
