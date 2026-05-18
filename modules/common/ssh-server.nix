{ ... }:
{
  flake.nixosModules.ssh-server =
    { ... }:
    {
      services.openssh = {
        enable = true;
        settings = {
          PermitRootLogin = "no";
        };
      };
      services.fail2ban.enable = true;
    };
}
