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
}
