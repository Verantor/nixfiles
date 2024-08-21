{ pkgs
, inputs
, ...
}:
let
  unstable = inputs.nixpkgs-unstable;
  neovimconfig = import ./config;
  nvim = inputs.nixvim.legacyPackages.x86_64-linux.makeNixvimWithModule {
    inherit pkgs;
    module = neovimconfig;
  };
in
{
  home.packages = [
    nvim
  ];
}
