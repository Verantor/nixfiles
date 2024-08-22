{
  plugins = {
    lsp-format = {
      enable = false; # Enable it if you want lsp-format integration for none-ls
    };
    lsp = {
      enable = true;
      capabilities = "offsetEncoding =  'utf-16'";
      servers = {
        clangd = { enable = true; };
        nixd = { enable = true; };
        #nil-ls = { enable = true; };
        # pyright = { enable = true; };
        pylyzer = { enable = true; };
        ruff-lsp = { enable = true; };
        gopls = { enable = true; };
        rust-analyzer = {
          enable = true;
          installCargo = true; #TODO maby conflicts with things
          installRustc = true;
          settings = {
            checkOnSave = true;
            check = {
              command = "clippy";
            };
            inlayHints = {
              enable = true;
              showParameterNames = true;
              parameterHintsPrefix = "<- ";
              otherHintsPrefix = "=> ";
            };
            procMacro = {
              enable = true;
            };
          };
        };
      };
    };
  };
}
