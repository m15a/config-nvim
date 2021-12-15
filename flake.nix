{
  description = "An example of neovim configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = { self, nixpkgs, flake-utils, neovim-nightly-overlay, ... }: {
    overlay = import ./overlay.nix;
  } // (flake-utils.lib.eachDefaultSystem (system:
  let
    pkgs = import nixpkgs {
      inherit system;
      overlays = [ self.overlay ];
    };
  in {
    devShell = pkgs.mkShell {
      buildInputs = [
        pkgs.selene
        pkgs.stylua
      ];
    };
  }));
}
