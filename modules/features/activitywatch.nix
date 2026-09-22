{ ... }:
{
  flake.nixosModules.activitywatch =
    { pkgs, ... }:
    {
      home-manager.sharedModules = [
        (
          { ... }:
          {
            services.activitywatch = {
              enable = true;
              watchers = {
                # TODO watchers crash after start because desktop doesnt exist yet
                aw-watcher-afk = {
                  package = pkgs.activitywatch;
                };
                awatcher = {
                  package = pkgs.awatcher;
                };
              };
            };
            # From https://github.com/nix-community/home-manager/blob/master/modules/services/activitywatch.nix
            systemd.user.services.activitywatch-sync = {
              Unit = {
                Description = "ActivityWatch sync daemon";
                After = [ "activitywatch.service" ];
                BindsTo = [ "activitywatch.target" ];
              };

              Service = {
                ExecStart = "${pkgs.activitywatch}/bin/aw-sync";

                # Some sandboxing.
                LockPersonality = true;
                NoNewPrivileges = true;
                RestrictNamespaces = true;
              };

              Install.WantedBy = [ "activitywatch.target" ];
            };
          }
        )
      ];

      programs.firefox = {
        policies = {
          "ExtensionSettings" = {
            # ActivityWatch
            "{ef87d84c-2127-493f-b952-5b4e744245bc}" = {
              "installation_mode" = "force_installed";
              "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/aw-watcher-web/latest.xpi";
              "default_area" = "menupanel";
              "private_browsing" = true;
            };
          };
        };
      };
    };
}
