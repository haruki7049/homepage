{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    treefmt-nix.url = "github:numtide/treefmt-nix";
    systems.url = "github:nix-systems/default";
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import inputs.systems;
      imports = [
        inputs.treefmt-nix.flakeModule
      ];
      perSystem =
        { pkgs, ... }:
        {
          treefmt = {
            projectRootFile = "flake.nix";
            programs.nixfmt.enable = true;
            programs.zig.enable = true;
            programs.actionlint.enable = true;
          };

          devShells.default = pkgs.mkShell {
            packages = [
              # Nix
              pkgs.nil

              # Ziglang
              pkgs.zig_0_13
              pkgs.zls
            ];

            shellHook = ''
              export PS1="\n[nix-shell\w]$ "
            '';
          };
        };
    };
}
