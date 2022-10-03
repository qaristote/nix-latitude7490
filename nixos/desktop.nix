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
    desktopManager = {
      xterm.enable = false;
      xfce = {
        enable = true;
        # noDesktop = true;
        # enableXfwm = false;
      };
    };
    # windowManager.i3.enable = true;
    displayManager = {
      lightdm = {
        enable = true;
        background = background-image;
      };
      defaultSession = "xfce";
    };
    # Hardware
    libinput = {
      enable = true;
      mouse.accelSpeed = "100.0";
    };
    layout = "us,fr";
    xkbOptions = "grp:win_space_toggle";
    autoRepeatDelay = 200;
  };

  # Allow all users to change hardware settings (brightness, backlight)
  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="intel_backlight", MODE="0666", RUN+="${pkgs.coreutils}/bin/chmod a+w /sys/class/backlight/%k/brightness"
    ACTION=="add", SUBSYSTEM=="leds", KERNEL=="dell::kbd_backlight", MODE="0666", RUN+="${pkgs.coreutils}/bin/chmod a+w /sys/class/leds/%k/brightness"
  '';

  # bigger tty fonts
  console.font = "${pkgs.terminus_font}/share/consolefonts/ter-u28n.psf.gz";
  services.xserver.dpi = 180;
  environment.variables = {
    GDK_SCALE = "2";
    GDK_DPI_SCALE = "0.5";
    _JAVA_OPTIONS = "-Dsun.java2d.uiScale=2";
  };
}
