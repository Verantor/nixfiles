{ pkgs, ... }:
{
  #Importallyourconfigurationmoduleshere
  imports = [
    "./alpha.nix"
    "./barbecue.nix"
    "./bufferline.nix"
    "./cmp.nix"
    "./commentary.nix"
    "./conform-nvim.nix"
    "./copilot-lua.nix"
    "./default.nix"
    "./fail.nix"
    "./flash.nix"
    "./friendly-snippets.nix"
    "./harpoon.nix"
    "./illuminate.nix"
    "./indent-blankline.nix"
    "./lsp.nix"
    "./lualine.nix"
    "./luasnip.nix"
    "./neo-tree.nix"
    "./noice.nix"
    "./telescope.nix"
    "./treesitter.nix"
    "./which-key.nix"
  ];
}
