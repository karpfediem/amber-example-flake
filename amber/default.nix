{
  pkgs,
  system,
  nix-filter,
  amber,
  ...
}:
pkgs.stdenv.mkDerivation {
  name = "amber-scripts";
  src = nix-filter {
    root = ./.;
    include = [
      ./src
      (nix-filter.lib.matchExt "ab")
    ];
  };
  nativeBuildInputs = [
    amber.packages.${system}.default
    pkgs.bc
  ];

  installPhase = ''
    set -e
    mkdir $out
    amber build.ab build.sh
    patchShebangs build.sh
    ./build.sh src $out
  '';
}
