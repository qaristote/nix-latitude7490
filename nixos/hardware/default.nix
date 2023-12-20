{nixos-hardware, ...}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    # Community-curated hardware configuration
    nixos-hardware.nixosModules.dell-latitude-7490
    nixos-hardware.nixosModules.common-pc-ssd
  ];

  personal.hardware = {
    usb.enable = true;
    disks.crypted = "/dev/disk/by-uuid/ba5dc9cd-3a73-4a01-880b-8720844307ae";
    firmwareNonFree.enable = true;
    keyboard.keyMap = "fr";
    backlights = {
      screen = "intel_backlight";
      keyboard = "dell::kbd_backlight";
    };
    sound.enable = true;
  };

  # faulty Intel CPU
  boot.kernelParams = ["i915.dc_enable=0" "intel_idle.max_cstate=1"];
}
