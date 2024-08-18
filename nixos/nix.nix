{...}: {
  personal.nix = {
    enable = true;
    autoUpgrade = {
      enable = true;
      autoUpdateInputs = [
        "latitude-7490/home-manager"
        "latitude-7490/my-nixpkgs"
        "latitude-7490/nixos-hardware"
        "latitude-7490/nixpkgs"
        "latitude-7490/stylix"
      ];
    };
    flake = "git+file:///etc/nixos";
    gc.enable = true;
  };
}
