{...}: {
  personal.system = {
    autoUpgrade = {
      enable = true;
      autoUpdateInputs = [
        "latitude-7490/home-manager"
        "latitude-7490/my-nixpkgs/nur"
        "latitude-7490/nixos-hardware"
        "latitude-7490/nixpkgs"
        "latitude-7490/stylix"
      ];
    };
    flake = "git+file:///etc/nixos";
  };
  systemd.services.flake-update.preStart = ''
    pushd /home/qaristote/code/nix/machines/latitude-7490
    git status
    popd
  '';
}
