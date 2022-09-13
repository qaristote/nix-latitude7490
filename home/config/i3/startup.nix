{ config, lib, pkgs, ... }:

let background-image = config.home.wallpaper;
in {
  xsession.windowManager.i3.config.startup = let
    autostart = { command, always ? false, notification ? false }: {
      inherit command always notification;
    };
  in (lib.optional config.services.redshift.enable
    (autostart { command = "systemctl --user start redshift"; }))
  ++ (lib.optional (background-image != null) (autostart {
    command = "${pkgs.feh}/bin/feh --bg-scale ${background-image}";
  })) ++ (lib.optional config.services.xidlehook.enable
    (autostart { command = "systemctl --user xidlehook.service"; }))
  ++ (lib.optional config.services.emacs.enable
    (autostart { command = "systemctl --user start emacs.service"; })) ++ [
      (autostart { command = "xfce4-power-manager --daemon"; })
      (autostart { command = "rfkill block bluetooth"; })
      # Launch frequently used apps
      (autostart { command = ''i3-msg "workspace 10; exec keepassxc"''; })
    ];
}
