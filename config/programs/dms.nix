{ inputs, ... }:
{
  home-manager.users.atilo = {
    imports = [
      inputs.dankMaterialShell.homeModules.dankMaterialShell.default
    ];
    programs.dankMaterialShell = {
      enable = true;
      enableSystemd = true;
      enableVPN = false;
    };
  };
}
