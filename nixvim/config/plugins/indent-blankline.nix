{
  plugins.indent-blankline = {
    enable = true;
    settings = {
      exclude = {
        buftypes = [
          "terminal"
          "quickfix"
        ];
        filetypes = [
          "lspinfo"
          "packer"
          "checkhealth"
          "help"
          "man"
          "gitcommit"
          "TelescopePrompt"
          "TelescopeResults"
          "''"
        ];
      };
      indent = {
        smart_indent_cap = true;
        char = "▎";
      };
      scope = {
        enabled = true;
        show_end = true;
        show_exact_scope = true;
        show_start = true;
      };
    };
  };
}
