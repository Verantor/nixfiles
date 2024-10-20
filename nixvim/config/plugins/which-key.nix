{
  plugins.which-key = {
    enable = true;
    settings = {
      delay = 200;
      expand = 1;
      notify = true;
      preset = "modern";
      replace = {
        desc = [
          [
            "<space>"
            "SPACE"
          ]
          [
            "<leader>"
            "SPACE"
          ]
          [
            "<[cC][rR]>"
            "RETURN"
          ]
          [
            "<[tT][aA][bB]>"
            "TAB"
          ]
          [
            "<[bB][sS]>"
            "BACKSPACE"
          ]
        ];
      };
      spec = [
        {
          __unkeyed-1 = "<leader>f";
          group = "Telescope";
        }
        # {
        #   __unkeyed-1 = "<leader>a";
        #   group = "Add File To Harpoon";
        # }
        {
          __unkeyed-1 = "<leader>e";
          group = "File Operations";
        }
        {
          __unkeyed-1 = "<leader>h";
          group = "Harpoon";
        }
        {
          __unkeyed-1 = "<leader>c";
          group = "Conform Formatter";
        }
        {
          __unkeyed-1 = "<leader>m";
          group = "move";
        }
      ];
      icons = {
        breadcrumb = "»";
        group = "+";
        separator = ""; # ➜
      };
      win = {
        border = "single";
      };
    };
  };
}
