{ pkgs
, inputs
, ...
}:
let
  unstable = inputs.nixpkgs-unstable;
  neovimconfig = import ./config;
  nvim = inputs.nixvim.legacyPackages.makeNixvimWithModule {
    inherit unstable;
    module = neovimconfig;
  };
in
{
  home.packages = [
    nvim
  ];
}
