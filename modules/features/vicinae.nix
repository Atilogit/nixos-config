{ ... }:
{
  flake.nixosModules.vicinae =
    { pkgs, ... }:
    {
      home-manager.sharedModules = [
        (
          {
            config,
            lib,
            ...
          }:
          let
            vicinaehq-extensions = pkgs.fetchFromGitHub {
              owner = "vicinaehq";
              repo = "extensions";
              rev = "5d1d31a698d5ac0b25b7391fcce3d920cd9c552e";
              sha256 = "sha256-u9QmD1FnLf+64o60L4ldx81m88eeK5/EgNYTEAt9qIo=";
            };
          in
          {
            programs.vicinae = {
              enable = true;
              systemd.enable = true;
              enableFirefoxIntegration = true;
              extensions = [
                (config.lib.vicinae.mkExtension {
                  name = "process-manager";
                  npmDepsHash = "sha256-qHDcvlh4pIZaMdvrRy0il5ItVI7dh4HBXRTYXjI51/s=";
                  src = vicinaehq-extensions + "/extensions/process-manager";
                })
                (config.lib.vicinae.mkExtension {
                  name = "timer";
                  npmDepsHash = "sha256-DiCGRDzm8/ugEm+rMOFrKJw4Ou/tfK538ObWockAm1s=";
                  src = vicinaehq-extensions + "/extensions/timer";
                })
                (config.lib.vicinae.mkExtension {
                  name = "systemd";
                  npmDepsHash = "sha256-g7A5sImj9GRMpn4q8aovgTw3wyHDiDglZilE0qYXlZM=";
                  src = vicinaehq-extensions + "/extensions/systemd";
                })
                (config.lib.vicinae.mkExtension {
                  name = "ssh";
                  npmDepsHash = "sha256-Ro885XCiv74oh64ubPORSUrYGeSvwlWYncrqHtXDEUg=";
                  src = vicinaehq-extensions + "/extensions/ssh";
                })
                (config.lib.vicinae.mkExtension {
                  name = "protondb-search";
                  npmDepsHash = "sha256-1HYYBFHqQLFezBbAfuJflpoWu27yUmRf7ZbpKB+GDUY=";
                  src = vicinaehq-extensions + "/extensions/protondb-search";
                })
                (config.lib.vicinae.mkExtension {
                  name = "nix";
                  npmDepsHash = "sha256-TEyCCDjAtRYX2uH2TpLfe4/hTzyfMiyDhzVdyQXhEus=";
                  src = vicinaehq-extensions + "/extensions/nix";
                })
                (config.lib.vicinae.mkExtension {
                  name = "color-converter";
                  npmDepsHash = "sha256-EYvMY+NoCm8NaU3pEV5QUYEUkYZZiYXx7eCDD20TzrM=";
                  src = vicinaehq-extensions + "/extensions/color-converter";
                })
              ];
              settings = {
                close_on_focus_loss = true;
                language = "en";
                theme = {
                  dark = {
                    name = "one-dark";
                  };
                };
                launcher_window = {
                  opacity = 0.75;
                  compact_mode = {
                    enabled = true;
                  };
                };
                providers = {
                  core = {
                    entrypoints = {
                      sponsor = {
                        enabled = false;
                      };
                    };
                  };
                  developer = {
                    enabled = false;
                  };
                };
              };
            };
          }
        )
      ];

      environment.systemPackages = with pkgs; [
        libnotify # Timer
      ];
    };
}
