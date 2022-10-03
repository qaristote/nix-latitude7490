{ config, pkgs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix

    <nixos-hardware/lenovo/thinkpad/x1>
    <nixos-hardware/common/pc/ssd>
  ];

  # Bootloader
  boot.loader = {
    efi = { canTouchEfiVariables = true; };
    grub = {
      enable = true;
      version = 2;
      efiSupport = true;
      enableCryptodisk = true;
      device = "nodev";
      # extraEntries =
      #   # Recovery mode
      #   # Generate the image with generate-recovery.sh
      #   ''
      #   menuentry "NixOS - Recovery" {
      #   search --set=drive1 -fs-uuid 330B-45DE
      #          linux ($drive1)//kernels/recovery-linux-bzImage loglevel=4
      #          initrd ($drive1)//kernels/recovery-initrd
      #   }
      #   '';
    };
  };

  boot.initrd.luks.devices = {
    crypt = {
      name = "crypt";
      device = "/dev/disk/by-uuid/130523d8-c1dd-4e36-adbc-eeeff58193ca";
      preLVM = true;
    };
  };

  # Kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Hardware
  hardware.firmware = with pkgs; [ firmwareLinuxNonfree ];
}
