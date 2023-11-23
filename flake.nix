{
    description = "justinhschaaf Nix package repository";

    inputs = { nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable"; };

    outputs = { self, nixpkgs }:
        let
            system = "x86_64-linux";
            pkgs = import nixpkgs { inherit system; };
        in {
            packages.${system} = rec {
                dripicons = pkgs.callPackage ./pkgs/dripicons {};
                kenney-fonts = pkgs.callPackage ./pkgs/kenney-fonts {};
                major-mono-display = pkgs.callPackage ./pkgs/major-mono-display {};
                typewithpride = pkgs.callPackage ./pkgs/typewithpride {};
                vercetti = pkgs.callPackage ./pkgs/vercetti {};
            };
        };
}
