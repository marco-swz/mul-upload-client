{
  description = "Flake for the mul-upload-client";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }: {
        overlays.default = import ./overlay.nix;
    } // flake-utils.lib.eachSystem flake-utils.lib.allSystems (system:
	let 

	pkgs = import nixpkgs {
		inherit system;
        overlays = [
            self.overlays.default
        ];
	};

	in {
        packages.mul-upload-client = pkgs.callPackage pkgs.mul-upload-client {};

        packages.default = self.packages.${system}.mul-upload-client;

		devShells.default = import ./shell.nix { inherit pkgs; };
	});
}
