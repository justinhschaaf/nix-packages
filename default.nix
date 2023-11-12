{ pkgs ? import <nixpkgs> {}, ... }:

with pkgs;

let
    packages = rec {
        dripicons = callPackage ./pkgs/dripicons {};
        kenney-fonts = callPackage ./pkgs/kenney-fonts {};
        major-mono-display = callPackage ./pkgs/major-mono-display {};
        typewithpride = callPackage ./pkgs/typewithpride {};
        vercetti-regular = callPackage ./pkgs/vercetti-regular {};

        inherit pkgs; # similar to `pkgs = pkgs;` This lets callers use the nixpkgs version defined in this file.
    };
in
    packages
