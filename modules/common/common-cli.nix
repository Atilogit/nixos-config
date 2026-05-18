{ ... }:
{
  flake.nixosModules.common-cli =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        wget
        ncdu
        unzip
        zip
        btop
        fastfetch
        tokei
        vulkan-tools
        inotify-tools
        ffmpeg-full
        wl-clipboard
        file
        usbutils
        docker-compose
        android-tools # adb
        dix
      ];

      programs.direnv.enable = true;
      programs.nh = {
        enable = true;
        flake = "/home/atilo/nix-new#baller";
      };
    };
}
