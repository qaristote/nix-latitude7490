{ buildFirefoxXpiAddon, fetchurl, lib, stdenv }:
  {
    "add-custom-search-engine" = buildFirefoxXpiAddon {
      pname = "add-custom-search-engine";
      version = "4.2";
      addonId = "{af37054b-3ace-46a2-ac59-709e4412bec6}";
      url = "https://addons.mozilla.org/firefox/downloads/file/3812756/add_custom_search_engine-4.2-fx.xpi";
      sha256 = "86aaf173514ec2da55556eb339a9d7c115c6e070c5433ebff8db31baa8e165d5";
      meta = with lib;
      {
        description = "Add a custom search engine to the list of available search engines in the search bar and URL bar.";
        license = licenses.mpl20;
        platforms = platforms.all;
        };
      };
    "canvasblocker" = buildFirefoxXpiAddon {
      pname = "canvasblocker";
      version = "1.8";
      addonId = "CanvasBlocker@kkapsner.de";
      url = "https://addons.mozilla.org/firefox/downloads/file/3910598/canvasblocker-1.8-an+fx.xpi";
      sha256 = "817a6181be877668eca1d0fef9ecf789c898e6d7d93dca7e29479d40f986c844";
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
      version = "1.24.1";
      addonId = "{74145f27-f039-47ce-a470-a662b129930a}";
      url = "https://addons.mozilla.org/firefox/downloads/file/3927638/clearurls-1.24.1-an+fx.xpi";
      sha256 = "41259fc4c330261e19ff4d38734eb5fdad92e7a358a16175383e31c62d50f06b";
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
      version = "4.9.50";
      addonId = "addon@darkreader.org";
      url = "https://addons.mozilla.org/firefox/downloads/file/3943310/dark_reader-4.9.50-an+fx.xpi";
      sha256 = "e726c87b43dc7965a07a8d88396ea966cd3ab5d9d03743d938cda34081d4e067";
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
      version = "8.0.7";
      addonId = "@testpilot-containers";
      url = "https://addons.mozilla.org/firefox/downloads/file/3932862/firefox_multi_account_containers-8.0.7-fx.xpi";
      sha256 = "0e60e00c13dcc372b43ddb2e5428c2e3c1e79d2b23d7166df82d45245edc4f10";
      meta = with lib;
      {
        homepage = "https://github.com/mozilla/multi-account-containers/#readme";
        description = "Firefox Multi-Account Containers lets you keep parts of your online life separated into color-coded tabs. Cookies are separated by container, allowing you to use the web with multiple accounts and integrate Mozilla VPN for an extra layer of privacy.";
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
        description = "Open tabs, websites, and links in automatically managed disposable containers which isolate the data websites store (cookies, storage, and more) from each other, enhancing your privacy and security while you browse.";
        license = licenses.mit;
        platforms = platforms.all;
        };
      };
    "tree-style-tab" = buildFirefoxXpiAddon {
      pname = "tree-style-tab";
      version = "3.8.23";
      addonId = "treestyletab@piro.sakura.ne.jp";
      url = "https://addons.mozilla.org/firefox/downloads/file/3943215/tree_style_tab-3.8.23-fx.xpi";
      sha256 = "531cea228e243f187407a6a25b7390984835c8d5879dcfe516d7b337ec2369be";
      meta = with lib;
      {
        homepage = "http://piro.sakura.ne.jp/xul/_treestyletab.html.en";
        description = "Show tabs like a tree.";
        platforms = platforms.all;
        };
      };
    "ublock-origin" = buildFirefoxXpiAddon {
      pname = "ublock-origin";
      version = "1.42.4";
      addonId = "uBlock0@raymondhill.net";
      url = "https://addons.mozilla.org/firefox/downloads/file/3933192/ublock_origin-1.42.4-an+fx.xpi";
      sha256 = "bc3c335c961269cb40dd11551788d0d8674aefcacdc8fbdf6c19845eaea339ce";
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
      version = "3.98";
      addonId = "{f209234a-76f0-4735-9920-eb62507a54cd}";
      url = "https://addons.mozilla.org/firefox/downloads/file/3816853/unpaywall-3.98-fx.xpi";
      sha256 = "6893bea86d3c4ed7f1100bf0e173591b526a062f4ddd7be13c30a54573c797fb";
      meta = with lib;
      {
        homepage = "https://unpaywall.org/products/extension";
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