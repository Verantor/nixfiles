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
      addFile = "<leader>ha";
      toggleQuickMenu = "<C-e>";
      navNext = "<leader>hn";
      navPrev = "<leader>hp";
      tmuxGotoTerminal = {
        "1" = "<C-1>";
        "2" = "<C-2>";
      };
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>fm";
      action = "<cmd>:Telescope harpoon marks<cr>";
      options = {
        silent = true;
        desc = "[F]ind Harpoon [M]arks";
      };
    }
  ];
}
