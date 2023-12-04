{
  inputs = {
    my-nixpkgs.url = "github:qaristote/my-nixpkgs/devenv";
    stylix.url = "github:danth/stylix";
    devenv.url = "github:cachix/devenv";
  };

  outputs =
    { self, nixpkgs, my-nixpkgs, nixos-hardware, home-manager, stylix, devenv }:
    let
      system = "x86_64-linux";
      overlays-module = { ... }: {
        nixpkgs.overlays = [ my-nixpkgs.overlays.personal ];
      };
      homeModules = [ my-nixpkgs.homeModules.personal ./home ];
      homeSpecialArgs = { inherit devenv; };
      nixosModules =
        [ overlays-module my-nixpkgs.nixosModules.personal ./nixos ];
    in {
      nixosConfigurations.latitude-7490 = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit nixos-hardware home-manager homeModules homeSpecialArgs stylix;
        };
        modules = nixosModules;
      };

      homeConfigurations.qaristote = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."${system}";
        modules = homeModules;
        extraSpecialArgs = homeSpecialArgs;
      };
    };
}
