{ ... }: {
  plugins.indent-blankline = {
    enable = true;
    settings = {
      indent = {
        char = "│";
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
