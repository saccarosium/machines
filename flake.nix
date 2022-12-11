{
  description = "Configuration for my machines";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable"; # primary nixpkgs
    darwin.url = "github:saccarosium/nix-darwin/rebuild-flake-no-out-link";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, darwin, nixpkgs }: {
    darwinConfigurations.macbook = darwin.lib.darwinSystem {
      system = "x86_64-darwin";
      modules = [ ./hosts/darwin.nix ];
    };
  };
}
