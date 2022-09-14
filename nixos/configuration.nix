# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ lib, config, pkgs, ... }:

{
  imports = [
    <home-manager/nixos>

    ./boot.nix
    ./locale.nix
    ./networking.nix
    ./desktop.nix
    ./users.nix
    ./services.nix
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [ vim busybox coreutils openssl ];
  nixpkgs.config = { allowUnfree = true; };

  nix = {
    # package = pkgs.nixUnstable;
    # extraOptions = ''
    # experimental-features = nix-command flakes
    # '';
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-old";
    };
    settings = {
      substituters = [ "https://hydra.iohk.io" "https://iohk.cachix.org" ];
      trusted-public-keys = [ "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ=" "iohk.cachix.org-1:DpRUyj7h7V830dp/i6Nti+NEO2/nhblbov/8MW7Rqoo=" ];
    };
  };

  system.autoUpgrade = {
    enable = true;
    flags = [ "--upgrade-all" ];
  };
  systemd.services.nix-gc.after = lib.mkIf config.system.autoUpgrade.enable [ "nixos-upgrade.service" ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?
}
