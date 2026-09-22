{ ... }:
{
  flake.nixosModules.firefox =
    { ... }:
    {
      programs.firefox = {
        enable = true;
        languagePacks = [
          "de"
          "en-US"
        ];
        preferencesStatus = "locked";
        policies = {
          "Preferences" = {
            "general.autoScroll" = true;
            "browser.aboutConfig.showWarning" = false;
            "browser.startup.page" = 3; # Open previous windows and tabs
            "media.eme.enabled" = true; # Play DRM content
            "privacy.globalprivacycontrol.enabled" = true;
            "signon.rememberSignons" = false;
            "browser.translations.automaticallyPopup" = false;
            "browser.toolbars.bookmarks.visibility" = "never";
            "browser.ml.chat.provider" = "https://chatgpt.com";
            "media.autoplay.default" = 0; # Allow autoplay
            "media.videocontrols.picture-in-picture.enabled" = false;
            "browser.ml.chat.shortcuts" = false;
            "extensions.formautofill.addresses.enabled" = false;
            "extensions.formautofill.creditCards.enabled" = false;
            # "browser.tabs.min_inactive_duration_before_unload" = 2147483647; # Disable tab unloading
            "browser.link.open_newwindow.override.external" = 7; # Open links from apps next to your active tab
            "browser.tabs.groups.smart.optin" = true; # Local AI tab group names
            "browser.tabs.insertAfterCurrent" = true; # Tabs next to current and in same group
          };
          "DisableTelemetry" = true;
          "DisablePocket" = true;
          "DisableFirefoxAccounts" = true;
          "DisableAccounts" = true;
          "EnableTrackingProtection" = {
            "Value" = true;
            "Locked" = true;
            "Cryptomining" = true;
            "Fingerprinting" = true;
            "EmailTracking" = true;
            "Exceptions" = [ ];
          };
          "ExtensionSettings" = {
            # uBlock
            "uBlock0@raymondhill.net" = {
              "installation_mode" = "force_installed";
              "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
              "default_area" = "menupanel";
              "private_browsing" = true;
            };
            # ClearURLs
            "{74145f27-f039-47ce-a470-a662b129930a}" = {
              "installation_mode" = "force_installed";
              "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/clearurls/latest.xpi";
              "default_area" = "menupanel";
              "private_browsing" = true;
            };
            # Privacy Badger
            "jid1-MnnxcxisBPnSXQ@jetpack" = {
              "installation_mode" = "force_installed";
              "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi";
              "default_area" = "menupanel";
              "private_browsing" = true;
            };
            # Sponsorblock
            "sponsorBlocker@ajay.app" = {
              "installation_mode" = "force_installed";
              "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi";
              "default_area" = "menupanel";
              "private_browsing" = true;
            };
            # Proton pass
            "78272b6fa58f4a1abaac99321d503a20@proton.me" = {
              "installation_mode" = "force_installed";
              "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/proton-pass/latest.xpi";
              "default_area" = "navbar";
              "private_browsing" = true;
            };
            # Adaptive Tab Bar Color
            "ATBC@EasonWong" = {
              "installation_mode" = "force_installed";
              "install_url" =
                "https://addons.mozilla.org/firefox/downloads/latest/adaptive-tab-bar-colour/latest.xpi";
              "default_area" = "menupanel";
              "private_browsing" = true;
            };
            # Dark Reader
            "addon@darkreader.org" = {
              "installation_mode" = "force_installed";
              "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi";
              "default_area" = "navbar";
              "private_browsing" = true;
            };
            # Consent-O-Matic
            "gdpr@cavi.au.dk" = {
              "installation_mode" = "force_installed";
              "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/consent-o-matic/latest.xpi";
              "default_area" = "menupanel";
              "private_browsing" = true;
            };
            # SingleFile
            "{531906d3-e22f-4a6c-a102-8057b88a1a63}" = {
              "installation_mode" = "force_installed";
              "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/single-file/latest.xpi";
              "default_area" = "navbar";
              "private_browsing" = true;
            };
            # Tampermonkey
            "firefox@tampermonkey.net" = {
              "installation_mode" = "force_installed";
              "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/tampermonkey/latest.xpi";
              "default_area" = "menupanel";
              "private_browsing" = true;
            };
            # SteamDB
            "firefox-extension@steamdb.info" = {
              "installation_mode" = "force_installed";
              "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/steam-database/latest.xpi";
              "default_area" = "menupanel";
              "private_browsing" = true;
            };
            # LocalCDN
            "{b86e4813-687a-43e6-ab65-0bde4ab75758}" = {
              "installation_mode" = "force_installed";
              "install_url" =
                "https://addons.mozilla.org/firefox/downloads/latest/localcdn-fork-of-decentraleyes/latest.xpi";
              "default_area" = "menupanel";
              "private_browsing" = true;
            };
            # Return YouTube Dislike
            "{762f9885-5a13-4abd-9c77-433dcd38b8fd}" = {
              "installation_mode" = "force_installed";
              "install_url" =
                "https://addons.mozilla.org/firefox/downloads/latest/return-youtube-dislikes/latest.xpi";
              "default_area" = "menupanel";
              "private_browsing" = true;
            };
          };
        };
        # Settings that policies don't allow
        autoConfigFiles = [
          (builtins.toFile "firefox.cfg" ''
            // IMPORTANT: Start your code on the 2nd line
            lockPref("sidebar.verticalTabs", true);
            lockPref("sidebar.main.tools", "aichat,history,bookmarks");
          '')
        ];
      };
    };
}
