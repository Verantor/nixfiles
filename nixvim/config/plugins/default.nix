# { lib, ... }:
# let
#   definitions = lib.attrNames (
#     lib.filterAttrs
#       (
#         filename: kind:
#           filename
#           != "default.nix"
#           && (kind == "regular" || kind == "directory")
#       )
#       (builtins.readDir ./.)
#   );
# in
# lib.mkMerge (map (file: import ./${file}) definitions)
{
  #Importallyourconfigurationmoduleshere
  imports = [
    ./alpha.nix
    ./barbar.nix
    ./cmp.nix
    ./comment.nix
    ./conform-nvim.nix
    ./copilot-lua.nix
    ./flash.nix
    ./friendly-snippets.nix
    ./harpoon.nix
    ./illuminate.nix
    ./indent-blankline.nix
    ./lsp.nix
    ./lualine.nix
    ./luasnip.nix
    ./neo-tree.nix
    ./noice.nix
    ./telescope.nix
    ./treesitter.nix
    ./which-key.nix
    ./trouble.nix
    ./undotree.nix
    ./gitsigns.nix
    ./neoscroll.nix
    ./cursorline.nix
    ./nvim-colorizer.nix
    ./nvim-autopairs.nix
    ./surround.nix
    ./rainbow-delimiters.nix
    ./multicursors.nix
    ./precognition.nix
    ./yanky.nix
    ./spectre.nix
    ./web-devicons.nix
    ./render-markdown.nix
  ];
}
