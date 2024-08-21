{
  # Import all your configuration modules here
  imports = [ ./plugins ];

  enable = true;
  defaultEditor = true;

  performance = {
    byteCompileLua.enable = true;
  };

  viAlias = true;
  vimAlias = true;

  luaLoader.enable = true;
}
