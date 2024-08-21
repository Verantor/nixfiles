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
    action = "<cmd>make<CR>";
    key = "<C-m>";
    options = {
      silent = true;
    };
  }
];
}
