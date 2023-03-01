{ pkgs, ... }:

{
  personal.nix = {
    enable = true;
    autoUpgrade = true;
    flake = "git+file:///etc/nixos";
    gc.enable = true;
  };

  system.autoUpgrade.flags = pkgs.personal.lib.updateInputFlags [
    "latitude-7490/nixpkgs"
    "latitude-7490/home-manager"
    "latitude-7490/nixos-hardware"
    "latitude-7490/my-nixpkgs"
  ];

  # make auto-upgrade service lightweight
  systemd.services.nixos-upgrade.unitConfig = { CPUWeight = 1; };
}
