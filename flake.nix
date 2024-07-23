{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    treefmt-nix.url = "github:numtide/treefmt-nix";
  };

  outputs = { self, nixpkgs, flake-utils, treefmt-nix, ... }:
    flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs {
        inherit system;
      };
      builder = pkgs.writeShellApplication {
        name = "builder";

        text = ''
          ${pkgs.bun}/bin/bun run build
        '';
      };
    in {
      apps = {
        inherit builder;
        default = builder;
      };

      packages = {
        inherit builder;
        default = builder;
      };

      devShells.default = pkgs.mkShell {
        packages = [
          pkgs.bun
          pkgs.typescript-language-server
        ];
      };
    });
}
