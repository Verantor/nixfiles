{
  # Import all your configuration modules here
  imports = [ ./plugins ];

  globals.mapleader = " ";
  performance = {
    byteCompileLua.enable = true;
  };
  colorschemes.kanagawa = {
    enable = true;

  };
  luaLoader.enable = true;
  clipboard.providers.wl-copy.enable = true;
  keymaps = [
    {
      key = "<leader>ee";
      action = "<Cmd>Neotree toggle<CR>";
      options = {
        desc = "Open NeoTree";
      };
    }
    {
      key = "<leader>en";
      action = "<Cmd>new ";
      options = {
        desc = "New File";
      };
    }
  ];
}
