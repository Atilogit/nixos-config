{ ... }:
{
  flake.nixosModules.common-cli =
    { pkgs, config, ... }:
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
        openconnect
        llama-cpp-vulkan
        poppler-utils # pdfunite
        xlsclients
      ];

      programs.direnv.enable = true;
      programs.nh = {
        enable = true;
        flake = "/home/atilo/nix-new#${config.networking.hostName}";
      };

      programs.bash.interactiveShellInit = ''
        alias switch="nh os switch"

        # Delete words with Ctrl + Backspace
        stty werase ^H

        function watch() {
            inotifywait -rme close_write,move,create,delete . |
            while read; do
                $@
            done
        }
      '';
    };
}
