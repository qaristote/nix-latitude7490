{ config, pkgs, ... }:

let
  backgroundImage = config.home.wallpaper;
  lockscreen = pkgs.personal.lockscreen.override { inherit backgroundImage; };
in {
  xsession.enable = true;

  # Look and feel
  home.pointerCursor = {
    name = "Numix-Cursor-Light";
    package = pkgs.numix-cursor-theme;
  };
  dconf.enable = true;
  home.packages = with pkgs; [ dconf ];
  gtk = {
    enable = true;
    theme = {
      name = "Arc-Dark";
      package = pkgs.arc-theme;
    };
    iconTheme = {
      name = "breeze-dark";
      package = pkgs.breeze-icons;
    };
  };
  qt = {
    enable = true;
    platformTheme = "gtk";
  };

  # Session managment
  # services.xidlehook = {
  #   enable = backgroundImage != null;
  #   not-when-fullscreen = true;
  #   not-when-audio = true;
  #   timers = [
  #     {
  #       delay = 120;
  #       command = "${pkgs.brightnessctl}/bin/brightnessctl set 10%-";
  #       canceller = "${pkgs.brightnessctl}/bin/brightnessctl set +10%";
  #     }
  #     {
  #       delay = 180;
  #       command = "${lockscreen}/bin/lockscreen.sh";
  #     }
  #   ];
  # };
}
