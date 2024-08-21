{
  plugins.harpoon = {
    enable = true;
    enableTelescope = true;
    menu = {
      borderChars = [
        "─"
        "│"
        "─"
        "│"
        "╭"
        "╮"
        "╯"
        "╰"
      ];
      height = 10;
      width = 60;
    };
    projects = {
      "$HOME/.dotfiled" = {
        termCommands = [
          "nixrb"
          "nixup"
        ];
      };
    };
    keymaps = {
      addFile = "<leader>a";
      toggleQuickMenu = "<C-e>";
      navFile = {
        "1" = "<C-j>";
        "2" = "<C-k>";
        "3" = "<C-l>";
        "4" = "<C-m>";
      };
    };
  };
}
