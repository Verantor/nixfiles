{
  plugins.nvim-colorizer = {
    enable = true;
    filesystem = {
      hijackNetrwBehavior = "open_current";
      filteredItems = {
        hideDotfiles = false;
        hideGitignored = false;
      };
    };
  };
}
