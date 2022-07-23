{
  description = "An example of neovim configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    vim-extra-plugins = {
      url = "github:m15a/nixpkgs-vim-extra-plugins";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, flake-utils, neovim-nightly-overlay, vim-extra-plugins, ... }: {
    overlays.default = import ./nix/overlay.nix;
  } // (flake-utils.lib.eachDefaultSystem (system:
  let
    pkgs = import nixpkgs {
      inherit system;
      overlays = [
        neovim-nightly-overlay.overlay
        vim-extra-plugins.overlays.default
        self.overlays.default
      ];
    };
  in rec {
    packages = {
      inherit (pkgs)
      my-neovim;
    };

    packages.default = packages.my-neovim;

    apps = {
      my-neovim = flake-utils.lib.mkApp {
        drv = packages.my-neovim;
        name = "nvim";
      };
    };

    apps.default = apps.my-neovim;

    devShells.default = pkgs.mkShell {
      buildInputs = [
        pkgs.selene
        pkgs.stylua
        pkgs.pre-commit
      ];
    };
  }));
}