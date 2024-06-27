{
  description = "Nix + Amber example";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    amber.url = "github:Ph0enixKM/Amber";
    nix-filter.url = "github:numtide/nix-filter";
  };

  outputs = inputs @ {
    flake-parts,
    amber,
    nix-filter,
    ...
  }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin"];

      imports = [];

      perSystem = {
        pkgs,
        system,
        ...
      }: {
        packages.default = (import ./amber) {inherit pkgs system amber nix-filter;};
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            amber.packages.${system}.default
            pkgs.bc
          ];
        };
      };
      flake = {
      };
    };
}
