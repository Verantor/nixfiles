let
  # Read all files in the current directory
  files = builtins.readDir ./.;

  # Filter out default.nix and non-.nix files
  nixFiles =
    builtins.filter
      (name: name != "default.nix" && builtins.match ".*\\.nix" name != null)
      (builtins.attrNames files);

  # Create a list of import statements
  imports = map (name: ./. + "/${name}") nixFiles;
in
{
  # Import all configuration modules automatically
  imports = imports;
}
# {
#   #Importallyourconfigurationmoduleshere
#   imports = [
#     ./alpha.nix
#     ./barbar.nix
#     ./cmp.nix
#     ./comment.nix
#     ./conform-nvim.nix
#     ./copilot-lua.nix
#     ./flash.nix
#     ./friendly-snippets.nix
#     ./harpoon.nix
#     ./illuminate.nix
#     ./indent-blankline.nix
#     ./lsp.nix
#     ./lualine.nix
#     ./luasnip.nix
#     ./neo-tree.nix
#     ./noice.nix
#     ./telescope.nix
#     ./treesitter.nix
#     ./which-key.nix
#     ./trouble.nix
#     ./undotree.nix
#     ./gitsigns.nix
#     ./neoscroll.nix
#     ./cursorline.nix
#     ./nvim-colorizer.nix
#     ./nvim-autopairs.nix
#     ./surround.nix
#     ./rainbow-delimiters.nix
#     ./multicursors.nix
#     ./precognition.nix
#     ./yanky.nix
#     ./spectre.nix
#     ./web-devicons.nix
#     ./render-markdown.nix
#   ];
# }

