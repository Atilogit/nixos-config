{ ... }:
{
  flake.nixosModules.ollama-nvidia =
    { pkgs, ... }:
    {
      services.ollama = {
        enable = true;
        package = pkgs.ollama-cuda;
      };
    };
}
