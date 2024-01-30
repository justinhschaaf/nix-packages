{
    description = "justinhschaaf Nix package repository";

    inputs = { nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable"; };

    outputs = { self, nixpkgs }:
        let
            system = "x86_64-linux";
            pkgs = import nixpkgs { inherit system; };
        in {
            packages.${system} = rec {
                bayon = pkgs.callPackage ./pkgs/fonts/bayon {};
                dripicons = pkgs.callPackage ./pkgs/fonts/dripicons {};
                kenney-fonts = pkgs.callPackage ./pkgs/fonts/kenney-fonts {};
                major-mono-display = pkgs.callPackage ./pkgs/fonts/major-mono-display {};
                typewithpride = pkgs.callPackage ./pkgs/fonts/typewithpride {};
                vercetti = pkgs.callPackage ./pkgs/fonts/vercetti {};
            };
        };
}
