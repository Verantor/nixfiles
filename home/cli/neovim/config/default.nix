{
  # Import all your configuration modules here
  imports = [ ./plugins ];
  nixvim = {
    enable = true;
    defaultEditor = true;

    performance = {
      byteCompileLua.enable = true;
    };

    viAlias = true;
    vimAlias = true;

    luaLoader.enable = true;
  };
}
