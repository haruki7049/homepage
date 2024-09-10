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
      zig = pkgs.zig_0_13;
    in {
      devShells.default = pkgs.mkShell {
        packages = [
          # Zig
          zig
          pkgs.zls

          # Nix
          pkgs.nil
        ];
      };
    });
}
