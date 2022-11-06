{ config, lib, pkgs, ... }:

let
  cfg = config.programs.emacs;
  spacemacs-update-script = pkgs.writeShellScript "spacemacs-update" ''
    ${pkgs.git}/bin/git pull
    ${cfg.package}/bin/emacsclient --eval '(configuration-layer/update-packages "no-confirmation")'
  '';
in {
  programs.emacs = {
    enable = true;
    package =
      pkgs.emacsWithPackages (ep: with ep; [ emacsql-sqlite emacsql-sqlite3 ]);
  };
  services.emacs = {
    enable = true;
    client.enable = true;
  };

  home.packages = with pkgs; [ gnutar ];

  home.file.".spacemacs.d/init.el".source = ./dotfiles/spacemacs;

  systemd.user = lib.mkIf cfg.enable
    (pkgs.personal.lib.serviceWithTimer "spacemacs-update" {
      Unit = {
        Description = "Update Spacemacs by pulling the develop branch";
        After = [ "network-online.target" "emacs.service" ];
      };
      Service = {
        Type = "oneshot";
        WorkingDirectory = "${config.home.homeDirectory}/.emacs.d/";
        ExecStart = "${spacemacs-update-script}";
      };
      Timer = {
        Persistent = true;
        OnCalendar = "daily";
      };
      Install = {
        WantedBy = [ "default.target" ];
      };
    });
}
