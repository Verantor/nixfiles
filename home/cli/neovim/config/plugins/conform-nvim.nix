{
  plugins.conform-nvim = {
    enable = true;
    formatOnSave = true;
    notifyOnError = true;
    formattersByFt =
      {
        # Conform will run multiple formatters sequentially
        python = [ "black" ];
        lua = [ "stylua" ];
        nix = [ "alejandra" ];
        markdown = [ [ "prettierd" "prettier" ] ];
        rust = [ "rustfmt" ];
        go = [ "gofmt" ];
        # Use a sub-list to run only the first available formatter
        javascript = [ [ "prettierd" "prettier" ] ];
        # Use the "*" filetype to run formatters on all filetypes.
        # "*" = [ "codespell" ];
        # Use the "_" filetype to run formatters on filetypes that don't
        # have other formatters configured.
        "_" = [ "trim_whitespace" ];
      };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>uf";
      action = ":FormatToggle<CR>";
      options = {
        desc = "Toggle Format";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>cf";
      action = "<cmd>lua require('conform').format()<cr>";
      options = {
        silent = true;
        desc = "Format Buffer";
      };
    }

    {
      mode = "v";
      key = "<leader>cF";
      action = "<cmd>lua require('conform').format()<cr>";
      options = {
        silent = true;
        desc = "Format Lines";
      };
    }
  ];
}
