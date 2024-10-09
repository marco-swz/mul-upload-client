{ pkgs ? import <nixpkgs> {} }:

pkgs.callPackage ./derivation.nix { inherit pkgs; }
