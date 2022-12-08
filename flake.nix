{
  description = "Configuration for my machines";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable"; # primary nixpkgs
    darwin.url = "github:lnl7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, darwin, nixpkgs }: {
    darwinConfigurations.macbook = darwin.lib.darwinSystem {
      system = "x86_64-darwin";
      modules = [ ./modules/darwin.nix ];
    };
  };
}
