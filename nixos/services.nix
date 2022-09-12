{ lib, config, pkgs, ... }:

let
  direnv-reload-service = user: {
    description = "Update virtual environments of user ${user}";

    restartIfChanged = false;
    unitConfig.X-StopOnRemoval = false;
    serviceConfig = {
      Type = "oneshot";
      User = user;
    };

    environment = {
      inherit (config.environment.sessionVariables) NIX_PATH;
      HOME = config.users.users."${user}".home;
    };

    path = with pkgs; [ direnv ];
    script = ''
       find $HOME -type d -name .nix-gc-roots -execdir direnv exec . true \;
    '';

    after = [ "nixos-upgrade.service" ];
    wantedBy = [ "nixos-upgrade.service" ];
  };
in {
  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  systemd.services.direnv-reload = lib.mkIf config.system.autoUpgrade.enable
    (direnv-reload-service "qaristote");
  systemd.services.nix-gc.after = [ "direnv-reload.service" ];
}
