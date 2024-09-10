{
  description = "Nix + Amber example";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    amber.url = "github:Ph0enixKM/Amber";
    nix-filter.url = "github:numtide/nix-filter";
    pre-commit-hooks-nix.url = "github:cachix/pre-commit-hooks.nix";
  };

  outputs = inputs @ {
    flake-parts,
    amber,
    nix-filter,
    ...
  }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin"];

      imports = [
        inputs.pre-commit-hooks-nix.flakeModule
      ];

      perSystem = {
        config,
        pkgs,
        system,
        self',
        ...
      }: {
        imports = [
          ./nix/pre-commit
        ];
        packages.amber-scripts = (import ./amber) {inherit pkgs system amber nix-filter;};
        packages.default = self'.packages.amber-scripts;
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            amber.packages.${system}.default
            pkgs.bc
          ];
          shellHook = ''
            ${config.pre-commit.installationScript}
          '';
        };
      };
      flake = {
      };
    };
}
