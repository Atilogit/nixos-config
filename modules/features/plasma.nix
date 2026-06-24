{ inputs, ... }:
{
  flake.nixosModules.plasma =
    { pkgs, ... }:
    {
      services.displayManager.plasma-login-manager.enable = true;
      services.desktopManager.plasma6.enable = true;
      home-manager.sharedModules = [ inputs.plasma-manager.homeModules.plasma-manager ];
      environment.systemPackages = with pkgs; [
        tesseract
        qt6.qtwebengine
      ];
      programs.kdeconnect.enable = true;
    };
}
