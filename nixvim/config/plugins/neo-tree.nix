{
  plugins.neo-tree = {
    enable = true;
    closeIfLastWindow = true;
    popupBorderStyle = "rounded";
    filesystem = {
      hijackNetrwBehavior = "open_current";
      filteredItems = {
        hideDotfiles = false;
        hideGitignored = false;
      };
    };
  };
}
