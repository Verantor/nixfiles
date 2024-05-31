{ pkgs
, lib
, ...
}: {
  programs.helix = {
    enable = true;
    settings = {
      theme = "tokyonight";
      keys.normal = {
        "{" = "goto_prev_paragraph";
        "}" = "goto_next_paragraph";
        "X" = "extend_line_above";
        "esc" = [ "collapse_selection" "keep_primary_selection" ];
        space.space = "file_picker";
        space.w = ":w";
        space.q = ":bc";
        "C-q" = ":xa"; # close all buffers and quit using ctrl-q
        "C-x" = "completion";
        space.u = {
          f = ":format"; # format using LSP formatter
          w = ":set whitespace.render all";
          W = ":set whitespace.render none";
        };
      };
      keys.insert = {
        "C-x" = "completion";

      };
      keys.select = {
        "%" = "match_brackets";
      };
      editor = {
        color-modes = true;
        auto-completion = true;
        completion-timeout = 5;
        cursorline = true;
        mouse = true;
        idle-timeout = 1;
        line-number = "relative";
        scrolloff = 5;
        #rainbow-brackets = true;
        completion-replace = true;
        bufferline = "always";
        true-color = true;
        rulers = [ 80 ];
        soft-wrap.enable = true;
        indent-guides = {
          render = true;
        };

        lsp = {

          enable = true;
          auto-signature-help = true;
          display-signature-help-docs = true;
          display-messages = true;
          display-inlay-hints = true;
          snippets = true;
        };
        gutters = [ "diagnostics" "line-numbers" "spacer" "diff" ];
        statusline = {
          # mode-separator = "";
          # separator = "";
          left = [ "mode" "selections" "spinner" "file-name" "total-line-numbers" ];
          center = [ ];
          right = [ "diagnostics" "file-encoding" "file-line-ending" "file-type" "position-percentage" "position" ];
          mode = {
            normal = "NORMAL";
            insert = "INSERT";
            select = "SELECT";
          };
        };

        whitespace = {
          render = "all";
          characters = {
            space = "·";
            nbsp = "⍽";
            tab = "→";
            newline = "⤶";
          };
        };

        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "block";
        };


      };
    };
    languages = {
      language = [
        {
          name = "bash";
          auto-format = true;
          formatter = {
            command = "${pkgs.shfmt}/bin/shfmt";
            args = [ "-i" "2" "-" ];
          };
        }
        {
          name = "html";
          file-types = [ "html" "tera" ];
        }
        {
          name = "clojure";
          injection-regex = "(clojure|clj|edn|boot|yuck)";
          file-types = [ "clj" "cljs" "cljc" "clje" "cljr" "cljx" "edn" "boot" "yuck" ];
        }
        {
          name = "nix";
          auto-format = true;
          formatter.command = "nixpkgs-fmt";
        }
        {

          name = "python";
          scope = "source.python";
          indent = { tab-width = 4; unit = " "; };
          formatter = { command = "black"; args = [ "-" "-q" ]; };
          roots = [ "pyproject.toml" "pyrightconfig.json" "Poetry.lock" ];
          language-servers = [ "python-ruff" "pyright" ];
          auto-format = true;
        }
        {
          name = "rust";
          auto-format = true;
          roots = [
            "Cargo.toml"
            "Cargo.lock"
          ];
          file-types = [ "rs" ];
          language-servers = [ "rust-analyzer" ];
        }
      ];

      language-server = {
        bash-language-server = {
          command = "${pkgs.nodePackages.bash-language-server}/bin/bash-language-server";
          args = [ "start" ];
        };

        clangd = {
          command = "${pkgs.clang-tools}/bin/clangd";
          clangd.fallbackFlags = [ "-std=c++2b" ];
        };

        nixd = {
          command = "nixd";
          config.nixd.formatting.command = [ "nixpkgs-fmt" ];
          config = {
            inlayHints = {
              bindingModeHints.enable = false;
              closingBraceHints.minLines = 10;
              closureReturnTypeHints.enable = "with_block";
              discriminantHints.enable = "fieldless";
              lifetimeElisionHints.enable = "skip_trivial";
              typeHints.hideClosureInitialization = false;
            };
          };
        };

        vscode-css-language-server = {
          command = "${pkgs.nodePackages.vscode-css-languageserver-bin}/bin/css-languageserver";
          args = [ "--stdio" ];
        };
        pyright = {
          command = "pyright-langserver";
          args = [ "--stdio" ];
        };
        pyright.config = {
          lint = true;
          inlayHint.enable = true;

        };
        python-ruff = {
          command = "ruff-lsp";
        };
        rust-analyzer = {
          command = "rust-analyzer";
          config = {
            inlayHints = {
              bindingModeHints.enable = false;
              closingBraceHints.minLines = 10;
              closureReturnTypeHints.enable = "with_block";
              discriminantHints.enable = "fieldless";
              lifetimeElisionHints.enable = "skip_trivial";
              typeHints.hideClosureInitialization = false;
            };
            check.command = "clippy";
          };
        };
      };
    };
  };

  home.packages = with pkgs; [
    # some other lsp related packages / dev tools
    shellcheck
    lldb
    gopls
    rust-analyzer
    clang-tools
    nodejs
    guile
    nim
    zig
    texlab
    zls
    jre8
    gcc
    uncrustify
    black
    alejandra
    shellcheck
    gawk
    nixd
    haskellPackages.haskell-language-server
    java-language-server
    kotlin-language-server
    nodePackages.vls
    nodePackages.jsonlint
    nodePackages.yarn
    nodePackages.vscode-langservers-extracted
    nodePackages.yaml-language-server # YAML / JSON
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
