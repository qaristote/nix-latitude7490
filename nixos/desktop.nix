{ config, pkgs, nixpkgs, ... }:

let
  # background-image = builtins.path {
  #   name = "background-image";
  #   path = /home/qaristote/.background-image;
  # };
  background-image = config.home-manager.users.qaristote.home.wallpaper;
in {
  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio = {
    enable = true;
    support32Bit = true;
    package = pkgs.pulseaudioFull;
    extraConfig = ''
      load-module module-dbus-protocol
    '';
  };
  nixpkgs.config.pulseaudio = true;

  # Enable X server
  services.xserver = {
    enable = true;
    desktopManager.xfce.enable = true;
    windowManager.i3.enable = true;
    displayManager = {
      lightdm = {
        enable = true;
        background = background-image;
        greeters.gtk = {
          enable = true;
          theme = {
            name = "Arc-Dark";
            package = pkgs.arc-theme;
          };
          iconTheme = {
            name = "Breeze-dark";
            package = pkgs.breeze-icons;
          };
        };
      };
      defaultSession = "xfce+i3";
    };
    # Hardware
    libinput.enable = true;
    layout = "fr";
    autoRepeatDelay = 200;
  };

  # Allow all users to change hardware settings (brightness, backlight)
  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="intel_backlight", MODE="0666", RUN+="${pkgs.coreutils}/bin/chmod a+w /sys/class/backlight/%k/brightness"
    ACTION=="add", SUBSYSTEM=="leds", KERNEL=="dell::kbd_backlight", MODE="0666", RUN+="${pkgs.coreutils}/bin/chmod a+w /sys/class/leds/%k/brightness"
  '';
}
