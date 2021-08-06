{ buildFirefoxXpiAddon, fetchurl, lib, stdenv }:
  {
    "canvasblocker" = buildFirefoxXpiAddon {
      pname = "canvasblocker";
      version = "1.6.1";
      addonId = "CanvasBlocker@kkapsner.de";
      url = "https://addons.mozilla.org/firefox/downloads/file/3799708/canvasblocker-1.6.1-an+fx.xpi";
      sha256 = "4db930c2100d3a01c001f60a7a168f41ec4a6374da6a55e2ae3b37aa37df8967";
      meta = with lib;
      {
        homepage = "https://github.com/kkapsner/CanvasBlocker/";
        description = "Alters some JS APIs to prevent fingerprinting.";
        license = licenses.mpl20;
        platforms = platforms.all;
        };
      };
    "clearurls" = buildFirefoxXpiAddon {
      pname = "clearurls";
      version = "1.21.0";
      addonId = "{74145f27-f039-47ce-a470-a662b129930a}";
      url = "https://addons.mozilla.org/firefox/downloads/file/3748919/clearurls-1.21.0-an+fx.xpi";
      sha256 = "eb0b199cd478b21bc1fab59be627603946d1474070aa4eb482c44d18c041d974";
      meta = with lib;
      {
        homepage = "https://clearurls.xyz/";
        description = "Removes tracking elements from URLs";
        license = licenses.lgpl3;
        platforms = platforms.all;
        };
      };
    "darkreader" = buildFirefoxXpiAddon {
      pname = "darkreader";
      version = "4.9.34";
      addonId = "addon@darkreader.org";
      url = "https://addons.mozilla.org/firefox/downloads/file/3806938/dark_reader-4.9.34-an+fx.xpi";
      sha256 = "9ba482118d25675af31ee403c740972a106fdccfd117c4449c046b70f1a2d95d";
      meta = with lib;
      {
        homepage = "https://darkreader.org/";
        description = "Dark mode for every website. Take care of your eyes, use dark theme for night and daily browsing.";
        license = licenses.mit;
        platforms = platforms.all;
        };
      };
    "multi-account-containers" = buildFirefoxXpiAddon {
      pname = "multi-account-containers";
      version = "7.3.0";
      addonId = "@testpilot-containers";
      url = "https://addons.mozilla.org/firefox/downloads/file/3713375/firefox_multi_account_containers-7.3.0-fx.xpi";
      sha256 = "4784cbd5de44d65f4cc014949dcbd315503f4913dfa7b3124b8d84c49515666a";
      meta = with lib;
      {
        homepage = "https://github.com/mozilla/multi-account-containers/#readme";
        description = "Firefox Multi-Account Containers lets you keep parts of your online life separated into color-coded tabs that preserve your privacy. Cookies are separated by container, allowing you to use the web with multiple identities or accounts simultaneously.";
        license = licenses.mpl20;
        platforms = platforms.all;
        };
      };
    "neat-url" = buildFirefoxXpiAddon {
      pname = "neat-url";
      version = "5.0.0";
      addonId = "neaturl@hugsmile.eu";
      url = "https://addons.mozilla.org/firefox/downloads/file/3557562/neat_url-5.0.0-an+fx.xpi";
      sha256 = "0b41899ea0eb424517bbe7ce067eae22de0ff659a0f171671e604edef86cfa2c";
      meta = with lib;
      {
        homepage = "http://hugsmile.eu";
        description = "Remove garbage from URLs.";
        license = licenses.gpl2;
        platforms = platforms.all;
        };
      };
    "redirector" = buildFirefoxXpiAddon {
      pname = "redirector";
      version = "3.5.3";
      addonId = "redirector@einaregilsson.com";
      url = "https://addons.mozilla.org/firefox/downloads/file/3535009/redirector-3.5.3-an+fx.xpi";
      sha256 = "eddbd3d5944e748d0bd6ecb6d9e9cf0e0c02dced6f42db21aab64190e71c0f71";
      meta = with lib;
      {
        homepage = "http://einaregilsson.com/redirector/";
        description = "Automatically redirects to user-defined urls on certain pages";
        license = licenses.mit;
        platforms = platforms.all;
        };
      };
    "smart-referer" = buildFirefoxXpiAddon {
      pname = "smart-referer";
      version = "0.2.15";
      addonId = "smart-referer@meh.paranoid.pk";
      url = "https://addons.mozilla.org/firefox/downloads/file/3470999/smart_referer-0.2.15-an+fx.xpi";
      sha256 = "4751ab905c4d9d13b1f21c9fc179efed7d248e3476effb5b393268b46855bf1a";
      meta = with lib;
      {
        homepage = "https://gitlab.com/smart-referer/smart-referer";
        description = "Improve your privacy by limiting Referer information leak!";
        platforms = platforms.all;
        };
      };
    "temporary-containers" = buildFirefoxXpiAddon {
      pname = "temporary-containers";
      version = "1.9.2";
      addonId = "{c607c8df-14a7-4f28-894f-29e8722976af}";
      url = "https://addons.mozilla.org/firefox/downloads/file/3723251/temporary_containers-1.9.2-fx.xpi";
      sha256 = "3340a08c29be7c83bd0fea3fc27fde71e4608a4532d932114b439aa690e7edc0";
      meta = with lib;
      {
        homepage = "https://github.com/stoically/temporary-containers";
        description = "Open tabs, websites, and links in automatically managed disposable containers. Containers isolate data websites store (cookies, storage, and more) from each other, enhancing your privacy and security while you browse.";
        license = licenses.mit;
        platforms = platforms.all;
        };
      };
    "tree-style-tab" = buildFirefoxXpiAddon {
      pname = "tree-style-tab";
      version = "3.8.7";
      addonId = "treestyletab@piro.sakura.ne.jp";
      url = "https://addons.mozilla.org/firefox/downloads/file/3807070/tree_style_tab_-3.8.7-fx.xpi";
      sha256 = "791e89cf720b0b7cc33a5b1fe6c1552490958b06e4ac0a456805fdbb3975b49c";
      meta = with lib;
      {
        homepage = "http://piro.sakura.ne.jp/xul/_treestyletab.html.en";
        description = "Show tabs like a tree.";
        platforms = platforms.all;
        };
      };
    "ublock-origin" = buildFirefoxXpiAddon {
      pname = "ublock-origin";
      version = "1.36.2";
      addonId = "uBlock0@raymondhill.net";
      url = "https://addons.mozilla.org/firefox/downloads/file/3806442/ublock_origin-1.36.2-an+fx.xpi";
      sha256 = "31f8c2126a3f4e3cfe3ef63550b842a5d4f071ec1c6e5aa377c2f29b11ff1415";
      meta = with lib;
      {
        homepage = "https://github.com/gorhill/uBlock#ublock-origin";
        description = "Finally, an efficient wide-spectrum content blocker. Easy on CPU and memory.";
        license = licenses.gpl3;
        platforms = platforms.all;
        };
      };
    "unpaywall" = buildFirefoxXpiAddon {
      pname = "unpaywall";
      version = "3.96";
      addonId = "{f209234a-76f0-4735-9920-eb62507a54cd}";
      url = "https://addons.mozilla.org/firefox/downloads/file/3806465/unpaywall-3.96-fx.xpi";
      sha256 = "fa19409ca9feab9121e39d01bb46fc658abcaded172adb5900a2b52c60bc9f65";
      meta = with lib;
      {
        homepage = "http://unpaywall.org/products/extension";
        description = "Get free text of research papers as you browse, using Unpaywall's index of ten million legal, open-access articles.";
        license = licenses.mit;
        platforms = platforms.all;
        };
      };
    "url-in-title" = buildFirefoxXpiAddon {
      pname = "url-in-title";
      version = "0.5";
      addonId = "{fcdb71fb-c9e5-48a3-9d04-e32713f5da88}";
      url = "https://addons.mozilla.org/firefox/downloads/file/792317/titleurl-0.5-an+fx-linux.xpi";
      sha256 = "5db99d775cef3c3da069b7e8e1b1e7d68c3720236c99827d85c4e78d3c35dbd7";
      meta = with lib;
      {
        homepage = "https://github.com/cloutierjo/titleUrl";
        description = "Add the current host name to the windows title bar. It adds the possibility to recognize the window from other application that work based on windows titles like KeePass's autotype.";
        license = licenses.gpl3;
        platforms = platforms.all;
        };
      };
    }