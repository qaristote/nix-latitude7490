{ config, lib, pkgs, ... }:

let
  backgroundImage = config.home.wallpaper;
  lockscreen = pkgs.personal.lockscreen.override { inherit backgroundImage; };
in {
  xsession.windowManager.i3.config = rec {
    modifier = "Mod4";

    keybindings = lib.mkOptionDefault (let
      brightnessctl = "${pkgs.brightnessctl}/bin/brightnessctl";
      brightnessctlKbd = "${brightnessctl} --device dell:kbd_backlight";
      pactl = "${pkgs.pulseaudio}/bin/pactl";
      rofi = "${pkgs.rofi}/bin/rofi";
    in {
      "${modifier}+Shift+Return" = "exec firefox";
      "${modifier}+Control+Return" = "exec $EDITOR";
      "${modifier}+Shift+e" = "exec xfce4-session-logout";
      "${modifier}+p" = "move workspace to output right";
      "XF86MonBrightnessUp" = "exec ${brightnessctl} set 5%+";
      "XF86MonBrightnessDown" = "exec ${brightnessctl} set 5%-";
      "XF86AudioRaiseVolume" =
        "exec ${pactl} set-sink-volume @DEFAULT_SINK@ +5%";
      "XF86AudioLowerVolume" =
        "exec ${pactl} set-sink-volume @DEFAULT_SINK@ -5%";
      "XF86AudioMute" = "exec ${pactl} set-sink-mute @DEFAULT_SINK@ toggle";
      "Shift+XF86AudioRaiseVolume" =
        "exec ${pactl} set-source-volume @DEFAULT_SOURCE@ +5%";
      "Shift+XF86AudioLowerVolume" =
        "exec ${pactl} set-source-volume @DEFAULT_SOURCE@ -5%";
      "XF86AudioMicMute" =
        "exec ${pactl} set-source-mute @DEFAULT_SOURCE@ toggle";
      "XF86KbdBrightnessUp" = ''
        exec ${brightnessctlKbd} set \
             $(( $(${brightnessctlKbd} max) - $(${brightnessctlKbd} get) ))
      '';
      "Print" = "exec xfce4-screenshooter";
    } // (lib.optionalAttrs (backgroundImage != null) {
      "${modifier}+l" = "exec ${lockscreen}/bin/lockscreen.sh";
    }) // (lib.optionalAttrs config.programs.alacritty.enable {
      "${modifier}+Return" = "exec ${pkgs.alacritty}/bin/alacritty";
    }) // (lib.optionalAttrs config.programs.rofi.enable {
      "${modifier}+d" = ''exec "${rofi} -modi drun,filebrowser,run,window -show drun"'';
      "${modifier}+Shift+d" = "exec ${rofi} -show window";
    }) // (lib.optionalAttrs config.services.emacs.client.enable {
      "${modifier}+Control+r" = "exec systemctl --user restart emacs.service";
    }));
  };
}
