{ config, pkgs, ... }:

{
  home.packages = with pkgs;
    [
      # Various
      evince
      gnupg
      keepassxc
      coreutils
      moreutils
      nixfmt
      pavucontrol
      zotero
    ] ++ [
      # Fonts
      material-design-icons
      roboto
      source-code-pro
    ] ++ [
      # Programming languages
      python3Full
    ];

  home.wallpaper = ./dotfiles/background-image;

  programs.bash = {
    enable = true;
    shellAliases = let
      nix-code-path = "~/code/nix";
      venv-manager-path = "~/.config/venv-manager";
    in {
      amimullvad = "curl -Ls https://am.i.mullvad.net/connected";
      nixos-update-config = import ./scripts/nixos-update-config nix-code-path;
      rm = "rm -f";
      ssh = "TERM=xterm-256color ssh";
      mkenv = ''
        cp ${venv-manager-path}/shell-template.nix ./shell.nix ;
        echo "use_nix" >> .envrc ;
        direnv allow ;
        $EDITOR shell.nix ;
      '';
      fftmp = "firefox --profile $(mktemp -d)";
      edit = "$EDITOR";
    };
    sessionVariables = {
      CDPATH = "~";
      EDITOR = "emacsclient -c";
      BROWSER = "firefox";
    };
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
  };

  home.file.".config/latexmkrc".source = ./dotfiles/latexmkrc;
  home.file.".config/venv-manager/config/default.nix".source =
    ./dotfiles/venv-manager.nix;
}
