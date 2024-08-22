{
  plugins.illuminate = {
    enable = true;
    delay = 100;
    filetypesDenylist = [
      "dirvish"
      "fugitive"
    ];
    providers = [
      "lsp"
      "treesitter"
      "regex"
    ];
    underCursor = true;
  };
}
