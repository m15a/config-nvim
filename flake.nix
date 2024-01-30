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

  outputs = { self, nixpkgs, flake-utils, neovim-nightly-overlay, vim-extra-plugins, ... }:
  let
    my-neovim-overlay = import ./nix/overlay.nix;
  in {
    overlays = rec {
        my-neovim = my-neovim-overlay;
        default = my-neovim;
    };
  } // (flake-utils.lib.eachDefaultSystem (system:
  let
    pkgs = import nixpkgs {
      inherit system;
      overlays = [
        neovim-nightly-overlay.overlays.default
        vim-extra-plugins.overlays.default
        my-neovim-overlay
      ];
    };
  in
  {
    packages = rec {
      inherit (pkgs) my-neovim;
      default = my-neovim;
    };

    apps = rec {
      my-neovim = flake-utils.lib.mkApp {
        drv = self.packages.${system}.my-neovim;
        name = "nvim";
      };
      default = my-neovim;
    };

    devShells.default = pkgs.mkShell {
      buildInputs = with pkgs; [
        selene
        stylua
        pre-commit
        lua-language-server
      ];
    };
  }));
}
