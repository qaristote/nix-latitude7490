{
  inputs = {
    my-nixpkgs.url = "github:qaristote/my-nixpkgs";
    stylix.url = "github:danth/stylix";
  };

  outputs = {
    nixpkgs,
    my-nixpkgs,
    nixos-hardware,
    home-manager,
    stylix,
    ...
  }: let
    system = "x86_64-linux";
    overlays-module = {...}: {
      nixpkgs.overlays = [my-nixpkgs.overlays.personal];
    };
    homeModules = [my-nixpkgs.homeModules.personal ./home];
    nixosModules = [overlays-module my-nixpkgs.nixosModules.personal ./nixos];
  in {
    nixosConfigurations.latitude-7490 = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit nixos-hardware home-manager homeModules stylix;
      };
      modules = nixosModules;
    };

    homeConfigurations.qaristote = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages."${system}";
      modules = homeModules;
    };
  };
}
