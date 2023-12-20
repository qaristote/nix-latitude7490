{pkgs, ...}: {
  personal.nix = {
    enable = true;
    autoUpgrade = true;
    flake = "git+file:///etc/nixos";
    gc.enable = true;
  };

  system.autoUpgrade.flags = pkgs.personal.lib.updateInputFlags [
    "latitude-7490/home-manager"
    "latitude-7490/my-nixpkgs"
    "latitude-7490/nixos-hardware"
    "latitude-7490/nixpkgs"
    "latitude-7490/stylix"
    "latitude-7490/devenv"
  ];
}
