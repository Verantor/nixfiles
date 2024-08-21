{
  plugins.telescope = {
    enable = true;
    extensions = {
      fzf-native = {
        enable = true;
      };
    };
    keymaps = {
      "<leader>f" = {
        options = {
          desc = "Telescope";
        };
      };
      "<leader>ff" = {
        action = "find_files";
        options = {
          desc = "Telescope Find Files";
        };
      };
      "<leader>fg" = {
        action = "live_grep";
        options = {
          desc = "Telescope Live Grep";
        };
      };
      "<leader>fb" = {
        action = "buffers";
        options = {
          desc = "Telescope Buffers";
        };
      };
      "<leader>fh" = {
        action = "help_tags";
        options = {
          desc = "Telescope Help Tags";
        };
      };
    };
  };
}
