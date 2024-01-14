{
  description = "Pyu's Nix-Darwin configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager}:
    let
      system = "aarch64-darwin"; 
      hostname = "penguin";
      username = "mixer";
      pkgs = import nixpkgs {system = "${system}";};
    in
      {
        # Build darwin flake using:
        # $ darwin-rebuild build --flake .#penguin
        system = "${system}";
        darwinConfigurations.${hostname} = nix-darwin.lib.darwinSystem {
          modules = [
            home-manager.darwinModules.home-manager{
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.${username} = import ./home.nix;
            }
            ./configuration.nix 
          ];
        };
        
        # Expose the package set, including overlays, for convenience.
        darwinPackages = self.darwinConfigurations.${hostname}.pkgs;
      };
}
