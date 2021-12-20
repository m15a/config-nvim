final: prev:

let
  config-nvim = final.vimUtils.buildVimPluginFrom2Nix {
    name = "config-nvim";
    src = ../.;
  };
in

{
  my-neovim = final.callPackage ./pkgs/my-neovim.nix {
    neovim = final.neovim-nightly;
    inherit config-nvim;
  };
}
