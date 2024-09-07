{
  plugins.treesitter = {
    enable = true;

    nixvimInjections = true;

    settings = {
      highlight.enable = true;
      indent.enable = true;
    };
    folding = false;
  };
  plugins.treesitter-refactor = {
    enable = true;
    smartRename.enable = true;
  };
}
