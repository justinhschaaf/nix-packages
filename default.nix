{ pkgs ? import <nixpkgs> {}, ... }:

with pkgs;

let
    packages = rec {
        dripicons = pkgs.callPackage ./pkgs/dripicons {};
        kenney-fonts = pkgs.callPackage ./pkgs/kenney-fonts {};
        major-mono-display = pkgs.callPackage ./pkgs/major-mono-display {};
        typewithpride = pkgs.callPackage ./pkgs/typewithpride {};
        vercetti = pkgs.callPackage ./pkgs/vercetti {};

        inherit pkgs; # similar to `pkgs = pkgs;` This lets callers use the nixpkgs version defined in this file.
    };
in
    packages
