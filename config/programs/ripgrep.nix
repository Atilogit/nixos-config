{ ... }:
{
  home-manager.users.atilo.programs.ripgrep = {
    enable = true;
    arguments = [
      "--smart-case"
      "--no-messages"
    ];
  };
}
