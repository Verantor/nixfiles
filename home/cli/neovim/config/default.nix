{
  # Import all your configuration modules here
  imports = [ ./plugins ];


  performance = {
    byteCompileLua.enable = true;
  };
  colorschemes.kanagawa = {
    enable = true;
  };
  luaLoader.enable = true;
}
