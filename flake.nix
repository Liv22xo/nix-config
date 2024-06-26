{
  description = "https://github.com/liv22xo NixOS VM";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
    };
  };

  outputs = { 
    self, 
    nixpkgs, 
    home-manager, 
    ...
    } @ inputs: let 
      inherit (self) outputs;
      lib = nixpkgs.lib // home-manager.lib;
      systems = ["x86_64-linux"];
      forEachSystem = f: lib.genAttrs systems (system: f pkgsFor.${system});
      pkgsFor = lib.genAttrs systems (system: 
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        });
    in {
      inherit lib;

      nixosConfigurations = {
	# Laptop VM
        "montana" = lib.nixosSystem {
          modules = [./hosts/montana];
          specialArgs = {inherit inputs outputs;};
        };
	# Desktop VM
        "salmo" = lib.nixosSystem {
          modules = [./hosts/salmo];
          specialArgs = {inherit inputs outputs;};
        };
      };
      
      homeConfigurations = {
	# Laptop VM
        "olivia@montana" = lib.homeManagerConfiguration {
          modules = [./home/olivia/montana.nix];
          pkgs = pkgsFor.x86_64-linux;
          extraSpecialArgs = {inherit inputs outputs;};
        };
	# Desktop VM
        "olivia@salmo" = lib.homeManagerConfiguration {
          modules = [./home/olivia/salmo.nix];
          pkgs = pkgsFor.x86_64-linux;
          extraSpecialArgs = {inherit inputs outputs;};
        };
      };
  };
}
