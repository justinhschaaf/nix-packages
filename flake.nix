{
    description = "justinhschaaf Nix package repository";

    inputs = { nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable"; };

    outputs = { self, nixpkgs }:
        let
            system = "x86_64-linux";
            pkgs = import nixpkgs { inherit system; };
        in {
            packages.${system} = rec {
                dripicons = callPackage ./pkgs/dripicons {};
                kenney-fonts = callPackage ./pkgs/kenney-fonts {};
                major-mono-display = callPackage ./pkgs/major-mono-display {};
                typewithpride = callPackage ./pkgs/typewithpride {};
                vercetti-regular = callPackage ./pkgs/vercetti-regular {};
            };
        };
}
