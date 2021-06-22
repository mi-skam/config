{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      url = "github:rycee/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { home-manager, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
      {
        homeManagerConfigurations = {
          linux = home-manager.lib.homeManagerConfiguration {
            configuration = ./home-linux.nix;
            system = system;
            homeDirectory = "/home/plumps";
            username = "plumps";
          };
        };
        devShell.${system} = pkgs.mkShell {
	 description = "hm-shell"; 
         shellHook = ''
            up () {
              nix build .#homeManagerConfigurations.linux.activationPackage && ./result/activate
            }
          '';
        };
      };

}
