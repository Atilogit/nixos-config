{ ... }:
{
  flake.nixosModules.python =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        (python3.withPackages (
          python-pkgs: with python-pkgs; [
            pip
            numpy
            onnxruntime
            pillow
          ]
        ))
      ];
    };
}
