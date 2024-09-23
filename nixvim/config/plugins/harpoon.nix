{
  plugins.harpoon = {
    enable = true;
    enableTelescope = true;
    keymapsSilent = true;
    keymaps = {
      addFile = "<leader>ha";
      toggleQuickMenu = "<C-e>";
      navFile = {
        "1" = "<leader>hj";
        "2" = "<leader>hk";
        "3" = "<leader>hl";
        "4" = "<leader>hm";
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
