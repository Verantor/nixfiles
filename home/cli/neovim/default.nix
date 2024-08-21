{ pkgs
, inputs
, ...
}:
let
  unstable = inputs.nixpkgs-unstable;
  neovimconfig = import ./config;
  nvim = inputs.nixvim.legacyPackages.x86_64-linux.makeNixvimWithModule {
    inherit unstable;
    module = neovimconfig;
  };
in
{
  home.packages = [
    nvim
  ];
}
