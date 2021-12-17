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

  vimExtraPlugins = prev.vimExtraPlugins.extend (self: super: {
    feline-nvim = super.feline-nvim.overrideAttrs (old: {
      patches = (old.patches or []) ++ [
        # https://github.com/famiu/feline.nvim/pull/177
        (final.fetchpatch {
          url = "https://github.com/mnacamura/feline.nvim/commit/2b2825fc46ff841d377720e4aa5326a290b34701.patch";
          sha256 = "14h9jp14hk93547b13i543h3k22qdwblkas83812ylvzpihx8lrc";
        })
      ];
    });
  });
}
