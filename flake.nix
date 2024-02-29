{
  description = "Rose's configuration flake thing";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: let system = "x86_64-linux";
    pkgs = inputs.nixpkgs.legacyPackages.${system};
    home-manager-config = toplevel: [
      home-manager.nixosModules.home-manager {
        home-manager.backupFileExtension = "bkup";
        home-manager.useGlobalPkgs = true;
        home-manager.extraSpecialArgs = {inherit inputs;};
        home-manager.users.jono = {
          imports = [
            toplevel
          ];
        };
      }
    ];
    common = [] ++ home-manager-config ./users/jono/home.nix;
  in {
    nixosConfigurations."adjectivishNoun" = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {inherit inputs;};
      modules = [ ./configuration.nix ] ++ common;
    };
  };
}
