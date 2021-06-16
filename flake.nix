{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      url = "github:rycee/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  
  outputs = inputs: {
    homeManagerConfigurations = {
      linux = inputs.home-manager.lib.homeManagerConfiguration {
        configuration = ./home-linux.nix;
        system = "x86_64-linux";
        homeDirectory = "/home/plumps";
        username = "plumps";
      };
    };
  };
    
}