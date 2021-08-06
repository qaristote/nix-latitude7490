{ pkgs, lib, config, fetchurl, stdenv, ... }:

with lib;
let
  mkUserJs = prefs: ''
    ${concatStrings (mapAttrsToList (name: value: ''
      user_pref("${name}", ${builtins.toJSON value});
    '') prefs)}
  '';
  config-template =
    builtins.readFile "${pkgs.personal.firefoxPackages.arkenfox-userjs}";
  config-default = config-template + mkUserJs {
    "browser.shell.checkDefaultBrowser" = true; # 0101
    "keyword.enabled" = true; # 0801
    "signon.rememberSignons" = false; # 0901
    "security.nocertdb" = true; # 1222
    "dom.allow_cut_copy" = true; # 2404
    "dom.battery.enabled" = false; # 2502
    "dom.vr.enabled" = false; # 2520
    "permissions.default.xr" = 2; # 2521

    # Personal
    "browser.tabs.warnOnClose" = false;
    "browser.tabs.warnOnCloseOtherTabs" = false;
    "clipboard.autocopy" = false;
    "browser.quitShortcut.disabled" = true;
    "browser.tabs.closeWindowWithLastTab" = false;
    "extensions.pocket.enabled" = false;
    "identity.fxaccounts.enabled" = false;
    "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
  };

  userchrome-treestyletabs = ''
    /* Hide main tabs toolbar */
    #TabsToolbar {
    visibility: collapse;
    }
    /* Sidebar min and max width removal */
    #sidebar {
    max-width: none !important;
    min-width: 0px !important;
    }
    /* Hide sidebar header, when using Tree Style Tab. */
    #sidebar-box[sidebarcommand="treestyletab_piro_sakura_ne_jp-sidebar-action"] #sidebar-header {
    visibility: collapse;
    }
  '';

in {
  programs.firefox = {
    enable = true;

    extensions = attrValues pkgs.personal.firefoxPackages.addons;
    # to add :
    # floccus + LoFloccus
    # Zotero

    profiles = {
      default = {
        id = 0; # isDefault = true

        extraConfig = config-default;
        userChrome = userchrome-treestyletabs;
      };

      # For video streaming
      streaming = {
        id = 1;

        extraConfig = config-default + mkUserJs {
          # Widevine (DRMs)
          "media.gmp-widevinecdm.enabled" = true;
          "media.eme.enabled" = true;
          # Cache
          "browser.cache.disk.enable" = true;
          "browser.cache.offline.storage" = true;
          # Privacy
          "privacy.clearOnShutdown.cache" = false;
          "privacy.clearOnShutdown.cookies" = false;
          "privacy.clearOnShutdown.siteSettings" = false;
        };
        userChrome = userchrome-treestyletabs;
      };

      videoconferencing = {
        id = 2;

        extraConfig = config-default + mkUserJs {
          # IMPORTANT: uncheck "Prevent WebRTC from leaking local IP addresses" in uBlock Origin's settings
          # NOTE: if using RFP (4501)
          # some sites, e.g. Zoom, need a canvas site exception [Right Click>View Page Info>Permissions]
          # Discord video does not work: it thinks you are FF78: use a separate profile or spoof the user agent
          "media.peerconnection.enabled" = true;
          "media.peerconnection.ice.no_host" =
            false; # may or may not be required
          "webgl.disabled" = false; # required for Zoom
          "webgl.min_capability_mode" = false;
          "media.getusermedia.screensharing.enabled" = true; # optional
          "media.autoplay.blocking_policy" =
            0; # optional (otherwise add site exceptions)
          "javascript.options.wasm" =
            true; # optional (some platforms may require this)
          "dom.webaudio.enabled" = true;
        };
        userChrome = userchrome-treestyletabs;
      };
    };
  };

  xdg.desktopEntries = let
    icons = pkgs.personal.icons;
    firefox-profiles-dir = "${config.home.homeDirectory}/.mozilla/firefox";
  in {
    netflix = {
      name = "Netflix";
      genericName = "Streaming service";
      icon = "${icons.netflix}";
      comment = "Unlimited movies, TV shows, and more.";
      exec =
        "${pkgs.firefox}/bin/firefox --profile ${firefox-profiles-dir}/streaming https://www.netflix.com/fr-en/login";
      categories = [ "AudioVideo" "Video" "Player" ];
    };
    mubi = {
      name = "MUBI";
      genericName = "Streaming service";
      icon = "${icons.mubi}";
      comment = "Watch hand-picked cinema.";
      exec =
        "${pkgs.firefox}/bin/firefox --profile ${firefox-profiles-dir}/streaming https://mubi.com";
      categories = [ "AudioVideo" "Video" "Player" ];
    };
    deezer = {
      name = "Deezer";
      genericName = "Streaming service";
      icon = "${icons.deezer}";
      comment = "Listen to music online";
      exec =
        "${pkgs.firefox}/bin/firefox --profile ${firefox-profiles-dir}/streaming https://deezer.com/login";
      categories = [ "AudioVideo" "Audio" "Player" "Music" ];
    };
  };
}
