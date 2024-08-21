{ pkgs
, inputs
, ...
}:
let
  neovimconfig = import ./config;
  nvim = inputs.nixvim.legacyPackages.makeNixvimWithModule {
    inherit pkgs;
    module = neovimconfig;
  };
in
{
  home.packages = [
    nvim
  ];
}
