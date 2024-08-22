{ pkgs, ... }: {
  home.packages = with pkgs; [
    # some other lsp related packages / dev tools

    lldb
    prettierd
    gopls
    nodePackages.prettier
    nixpkgs-lint
    statix
    rust-analyzer
    clang-tools
    nodejs

    zig

    zls
    jre8
    gcc
    uncrustify
    black
    alejandra
    shellcheck

    nixd

    cargo
    go
    #ruff
    clippy
    black
    ruff-lsp
    rustfmt
    pyright
    marksman
    markdown-oxide
    python3
    python311Packages.python-lsp-ruff
    python311Packages.python-lsp-server
    ripgrep
  ];
}
