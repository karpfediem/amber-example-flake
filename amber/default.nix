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
    mkdir $out
    
    build_amber() {
      set -xe
      local src_dir=$1
      local out_dir=$2
      local file_full_path=$3
      local file=$(realpath --relative-to "$src_dir" "$file_full_path")
      local full_out_path="$out_dir/$file"
      mkdir -p $(dirname "$full_out_path")
      amber "$src_dir/$file" "''${full_out_path%.*}.sh"
    }

    export -f build_amber
    find $src -type f -regex ".*\.ab$" -exec bash -c 'build_amber "$src" "$out" "$0"' {} \;
  '';
}
