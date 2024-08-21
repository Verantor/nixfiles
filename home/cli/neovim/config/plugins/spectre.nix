{ pkgs, ... }: {
  plugins.spectre = {
    enable = true;
    plugins.spectre.findPackage = pkgs.rg;
    plugins.spectre.replacePackage = pkgs.gnused;
  };
}
