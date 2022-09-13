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
    "media.peerconnection.enabled" = false; # 2001
    "media.peerconnection.ice.no_host" = true; # 2004
    "dom.allow_cut_copy" = true; # 2404
    "dom.battery.enabled" = false; # 2502
    "dom.vr.enabled" = false; # 2520
    "permissions.default.xr" = 2; # 2521
    "privacy.clearOnShutdown.cache" = false;
    "privacy.clearOnShutdown.downloads" = true;
    "privacy.clearOnShutdown.formdata" = true;
    "privacy.clearOnShutdown.history" = true;
    "privacy.clearOnShutdown.sessions" = true;

    # Personal
    ## Warnings
    "browser.tabs.warnOnClose" = false;
    "browser.tabs.warnOnCloseOtherTabs" = false;
    ## Updates
    "app.update.auto" = false;
    "browser.search.update" = false;
    ## Appearance
    "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
    ## Content behavior
    "clipboard.autocopy" = false;
    ## UX behavior
    "browser.quitShortcut.disabled" = true;
    "browser.tabs.closeWindowWithLastTab" = false;
    ## UX features
    "extensions.pocket.enabled" = false;
    "identity.fxaccounts.enabled" = false;
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
}
