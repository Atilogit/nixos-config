{ ... }:
{
  flake.nixosModules.helix =
    { pkgs, lib, ... }:
    {
      home-manager.sharedModules = [
        (
          { ... }:
          {
            programs.helix = {
              enable = true;
              ignores = [ "!.gitignore" ];
              settings = lib.importTOML ./config.toml;
              extraPackages = with pkgs; [
                nil
                nixd
                hyprls
                marksman
                clang-tools
              ];
            };
          }
        )
      ];
    };
}
