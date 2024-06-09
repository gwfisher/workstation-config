{
  description = "PraetorTEL NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
};

  outputs = { self, nixpkgs, home-manager, microvm, ...  }@inputs: {
    nixosConfigurations = {
      odin = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/odin

	        home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.users.wfisher = import ./users/wfisher/home.nix;
          }
        ];
      };
    };
  };
}
