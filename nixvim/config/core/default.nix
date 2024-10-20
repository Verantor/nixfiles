{ pkgs, ... }:
let
  version = "1.0.3";
in
{
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      pname = "fastaction.nvim";
      version = version;

      src = pkgs.fetchFromGitHub {
        owner = "Chaitanyabsprip";
        repo = "fastaction.nvim";
        rev = "v${version}";
        hash = "sha256-QCPE2hmSnNLO1/EfZXTc/PP8Q0QRw5D8T8EN+NyUv2s=";
      };
    })
  ];
  extraConfigLua = "require('fastaction').setup({dismiss_keys = {'j', 'k', '<c-c>', 'q'}, override_function = function(_) end, keys = 'qwertyuiopasdfghlzxcvbnm', popup = {border = 'rounded', hide_cursor = true, highlight = {divider = 'FloatBorder', key = 'MoreMsg', title = 'Title', window = 'NormalFloat'}, title = 'Select one of:'}, priority = {}, register_ui_select = false})";

  globals.mapleader = " ";
  performance = {
    byteCompileLua.enable = true;
    # combinePlugins.enable = true;
  };
  colorschemes.tokyonight = {
    enable = true;
    settings = {
      day_brightness = 1;
      dim_inactive = false;
      hide_inactive_statusline = false;
      light_style = "day";
      lualine_bold = false;
      on_colors = "function(colors) end";
      on_highlights = "function(highlights, colors) end";
      sidebars = [
        "qf"
        "vista_kind"
        "terminal"
        "packer"
      ];
      style = "night";
      styles = {
        comments = {
          italic = true;
        };
        floats = "dark";
        functions = { };
        keywords = {
          italic = true;
        };
        sidebars = "dark";
        variables = { };
      };
      terminal_colors = true;
      transparent = false;
    };
  };
  luaLoader.enable = true;
  clipboard = {
    providers.wl-copy.enable = true;
    register = "unnamedplus";
  };
  opts = {
    # Enable relative line numbers
    number = true;
    relativenumber = true;
    # Set tabs to 2 spaces
    tabstop = 4;
    softtabstop = 4;
    showtabline = 4;
    expandtab = true;

    # Enable auto indenting and set it to spaces
    smartindent = true;
    shiftwidth = 2;

    swapfile = false;
    autoread = true;
    backup = false;
    undofile = true;

    cursorline = true; # Highlight the line where the cursor is located

    encoding = "utf-8";
    fileencoding = "utf-8";
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
    # {
    #   key = "<leader>yf";
    #   action = "<cmd>%y<cr>";
    #   options = {
    #     desc = "yank current file to the clipboard buffer";
    #   };
    # }
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
      key = "<leader>q";
      action = "<cmd>q<CR>";
      options = {
        desc = "Quick exit";
      };
    }
    {
      key = "<leader>Q";
      action = "<cmd>q!<CR>";
      options = {
        desc = "Quick force exit";
      };
    }
    {
      key = "<leader>cx";
      action = "<cmd>!chmod +x %<cr>";
      options = {
        desc = "make file executable";
      };
    }
    # {
    #   key = "<C-u>";
    #   action = "<C-u>zz";
    #   options = {
    #     desc = "scroll up and center";
    #   };
    # }
    # {
    #   key = "<C-d>";
    #   action = "<C-d>zz";
    #   options = {
    #     desc = "scroll down and center";
    #   };
    # }
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
    {
      key = "<leader>ca";
      action = "<Cmd>lua require('fastaction').code_action()<CR>";
      options = {
        desc = "Code action";
        # buffer = true;
      };
    }
    {
      key = "<leader>y";
      action = "+y";
      options = {
        desc = "Copy to system clipboard";
      };
    }
    {
      key = "<leader>Y";
      action = "+yg_";
      options = {
        desc = "Copy to system clipboard";
      };
    }
    {
      key = "<leader>p";
      action = "+p";
      options = {
        desc = "Paste from system clipboard";
      };
    }
    {
      key = "<leader>P";
      action = "+P";
      options = {
        desc = "Paste from system clipboard";
      };
    }
    {
      mode = "n";
      key = "<Leader>tf";
      action = "<Cmd>ToggleTerm direction=float<CR>";
      options.desc = "Open floating terminal";
    }
    {
      mode = "n";
      key = "<Leader>th";
      action = "<Cmd>ToggleTerm size=10 direction=horizontal<CR>";
      options.desc = "Open terminal in horizontal split";
    }
    {
      mode = "n";
      key = "<Leader>tv";
      action = "<Cmd>ToggleTerm size=80 direction=vertical<CR>";
      options.desc = "Open terminal in vertical split";
    }
    {
      mode = "n";
      key = "<F5>";
      action = "<Cmd>execute v:count . 'ToggleTerm'<CR>";
      options.desc = "Toggle terminal";
    }
    {
      mode = "t";
      key = "<F5>";
      action = "<Cmd>ToggleTerm<CR>";
      options.desc = "Toggle terminal";
    }
    {
      mode = "i";
      key = "<F5>";
      action = "<Esc><Cmd>ToggleTerm<CR>";
      options.desc = "Toggle terminal";
    }
  ];
}
