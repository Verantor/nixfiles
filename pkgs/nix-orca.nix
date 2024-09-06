{
  lib,
  stdenv,
  fetchFromGitHub,
  buildGoModule,
  pkgs,
}: let
  version = "0.1.0";
in
  buildGoModule {
    pname = "nix-orca";
    inherit version;

    src = fetchFromGitHub {
      owner = "Verantor";
      repo = "nix-orca";
      rev = "v${version}";
      hash = "sha256-B1MHDXowxOCyzdkEWkJsax/38wGmI4Fe7/WPbI37W9Q=";
      # hash = lib.fakeHash;
    };
    nativeBuildInputs = [pkgs.installShellFiles];
    postInstall = ''
        installShellCompletion --cmd nix-orca \
      --fish <($out/bin/nix-orca completion fish) \
    '';
    vendorHash = "sha256-ImkjeeMnP58F0b/0p1AvPdG7zsl69iX9IEFLXvQgPEg=";
    # vendorHash = lib.fakeHash;
    meta = with lib; {
      homepage = "https://github.com/Verantor/nix-orca";
      description = "nix helper scripts";
      license = licenses.gpl3;
      maintainers = with maintainers; [Verantor];
    };
  }
