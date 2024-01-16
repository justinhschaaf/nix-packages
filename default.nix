{ pkgs ? import (fetchGit {
    url = "https://github.com/NixOS/nixpkgs.git";
    ref = "nixos-unstable";
    rev = "9b19f5e77dd906cb52dade0b7bd280339d2a1f3d";
}) {}, ... }:

with pkgs;

let
    packages = rec {
        bayon = pkgs.callPackage ./pkgs/bayon {};
        dripicons = pkgs.callPackage ./pkgs/dripicons {};
        kenney-fonts = pkgs.callPackage ./pkgs/kenney-fonts {};
        major-mono-display = pkgs.callPackage ./pkgs/major-mono-display {};
        typewithpride = pkgs.callPackage ./pkgs/typewithpride {};
        vercetti = pkgs.callPackage ./pkgs/vercetti {};

        inherit pkgs; # similar to `pkgs = pkgs;` This lets callers use the nixpkgs version defined in this file.
    };
in
    packages
