{ pkgs }:

let pkgs-rycee = pkgs.nur.repos.rycee;
in {
  addons = import ./addons.nix {
    inherit (pkgs) fetchurl stdenv lib;
    inherit (pkgs-rycee.firefox-addons) buildFirefoxXpiAddon;
  };
  arkenfox-userjs = pkgs.fetchurl {
    url =
      "https://raw.githubusercontent.com/arkenfox/user.js/3f09afdee07c5aea33f6dc4194e1425d6400a0d7/user.js";
    sha256 = "sha256:K1jY/XvsNO+rqUQ9aFhW2PGf6BIf1+RxkS5fAyLsgo8=";
  };
}
