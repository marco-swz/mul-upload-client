{ pkgs ? import <nixpkgs> {} }:

pkgs.callPackage ./package.nix { inherit pkgs; }
