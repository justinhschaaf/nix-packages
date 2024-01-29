# https://discourse.nixos.org/t/fixing-error-attribute-currentsystem-missing-in-flake/22386/7
{ system ? "x86_64-linux", pkgs ? import (fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/9b19f5e77dd906cb52dade0b7bd280339d2a1f3d.tar.gz";
    sha256 = "0939vbhln9d33xkqw63nsk908k03fxihj85zaf70i3il9z42q8mc";
}) { inherit system; }, ... }:

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
