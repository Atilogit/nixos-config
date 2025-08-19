{ pkgs, lib, ... }:
{
  home-manager.users.atilo.programs.helix = {
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
