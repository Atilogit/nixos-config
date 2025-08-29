{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    (inputs.quickshell.packages.x86_64-linux.default.withModules [
      kdePackages.qtsvg
      kdePackages.qtimageformats
      kdePackages.qtmultimedia
      kdePackages.qt5compat
      kdePackages.qtpositioning
    ])
  ];
}
