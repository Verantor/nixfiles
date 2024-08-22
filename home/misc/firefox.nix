{ pkgs, ... }: {
  home.file."firefox-gnome-theme" = {
    target = ".mozilla/firefox/default/chrome/firefox-gnome-theme";
    source = fetchTarball {
      url = "https://github.com/rafaelmardojai/firefox-gnome-theme/archive/master.tar.gz";
      sha256 = "02q15dclr0k8lqmynzy7gbn0ccnxjglbmnb3nniibia9gi93ycfw";
    };
  };

  programs.firefox = {
    enable = true;
    profiles.default = {
      name = "Default";
      settings = {
        "browser.pocket.enabled" = false;
        "extensions.pocket.enabled" = false;

        "browser.aboutwelcome.enabled" = false;
        "browser.discovery.enabled" = false;

        "browser.bookmarks.addedImportButton" = false;
        "browser.toolbars.bookmarks.visibility" = "never";
        # For Firefox GNOME theme:
        # "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        # "browser.tabs.drawInTitlebar" = true;
        # "svg.context-properties.content.enabled" = true;
        "extensions.autoDisableScopes" = 0;
      };
      userChrome = ''
        @import "firefox-gnome-theme/userChrome.css";
        @import "firefox-gnome-theme/theme/colors/dark.css";
      '';
      search = {
        force = true;
        default = "Google";
        privateDefault = "DuckDuckGo";
        engines = {
          "Nix Packages" = {
            urls = [
              {
                template = "https://search.nixos.org/packages";
                params = [
                  {
                    name = "channel";
                    value = "unstable";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            definedAliases = [ "@np" ];
          };

          "NixOS Options" = {
            urls = [
              {
                template = "https://search.nixos.org/options";
                params = [
                  {
                    name = "channel";
                    value = "unstable";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            definedAliases = [ "@no" ];
          };

          "NixOS Wiki" = {
            urls = [
              {
                template = "https://nixos.wiki/index.php";
                params = [
                  {
                    name = "search";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            definedAliases = [ "@nw" ];
          };

          "Nixpkgs Issues" = {
            urls = [
              {
                template = "https://github.com/NixOS/nixpkgs/issues";
                params = [
                  {
                    name = "q";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            definedAliases = [ "@ni" ];
          };

          "Nix Code" = {
            urls = [
              {
                template = "https://github.com/search";
                params = [
                  {
                    name = "type";
                    value = "Code";
                  }
                  {
                    name = "q";
                    value = "{searchTerms}+language%3ANix";
                  }
                ];
              }
            ];
            definedAliases = [ "@nc" ];
          };

          "Reddit" = {
            urls = [
              {
                template = "https://old.reddit.com/search";
                params = [
                  {
                    name = "q";
                    value = "{searchTerms}";
                  }
                  {
                    name = "include_over_18";
                    value = "on";
                  }
                ];
              }
            ];
            definedAliases = [ "@r" ];
          };
        };
      };
    };
  };
}
