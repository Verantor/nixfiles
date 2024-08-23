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
    ./bufferline.nix
    ./cmp.nix
    ./commentary.nix
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
  ];
}
