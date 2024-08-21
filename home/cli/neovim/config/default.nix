{
  # Import all your configuration modules here
  imports = [ ./plugins ];


  performance = {
    byteCompileLua.enable = true;
  };

  viAlias = true;
  vimAlias = true;

  luaLoader.enable = true;
}
