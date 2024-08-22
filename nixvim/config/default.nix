{
  # Import all your configuration modules here
  imports = [ ./plugins ];

  globals.mapleader = " ";
  #performance = {
  #  byteCompileLua.enable = true;
  #};
  colorschemes.kanagawa = {
    enable = true;

  };
  #luaLoader.enable = true;
  clipboard.providers.wl-copy.enable = true;
  opts = {
    # Enable relative line numbers
    number = true;
    relativenumber = true;
    # Set tabs to 2 spaces
    tabstop = 2;
    softtabstop = 2;
    showtabline = 2;
    expandtab = true;

    # Enable auto indenting and set it to spaces
    smartindent = true;
    shiftwidth = 2;
  };
  keymaps = [
    {
      key = "<leader>ee";
      action = "<Cmd>Neotree toggle<CR>";
      options = {
        desc = "Open NeoTree";
      };
    }
    {
      key = "<leader>ss";
      action = ":s/\\v";
      options = {
        desc = "search and replace on line";
      };
    }

    {
      key = "<leader>SS";
      action = ":%s/\\v";
      options = {
        desc = "search and replace in file";
      };
    }
    {
      key = "<leader>yf";
      action = "<cmd>%y<cr>";
      options = {
        desc = "yank current file to the clipboard buffer";
      };
    }
    {
      key = "<leader>df";
      action = "<cmd>%d_<cr>";
      options = {
        desc = "delete file content to black hole register";
      };
    }
    {
      key = "<leader>w";
      action = "<cmd>w<CR>";
      options = {
        desc = "Quick save";
      };
    }
    {
      key = "<leader>cx";
      action = "<cmd>!chmod +x %<cr>";
      options = {
        desc = "make file executable";
      };
    }
    {
      key = "<C-u>";
      action = "<C-u>zz";
      options = {
        desc = "scroll up and center";
      };
    }
    {
      key = "<C-d>";
      action = "<C-d>zz";
      options = {
        desc = "scroll down and center";
      };
    }
    {
      key = "n";
      action = "nzzzv";
      options = {
        desc = "keep cursor centered";
      };
    }
    {
      key = "N";
      action = "Nzzzv";
      options = {
        desc = "keep cursor centered";
      };
    }
    {
      key = "<leader>mj";
      action = "<cmd>m .+1<CR>==";
      options = {
        desc = "Move line down";
      };
    }
    {
      key = "<leader>mk";
      action = "<cmd>m .-2<CR>==";
      options = {
        desc = "Move line up";
      };
    }

  ];
}
