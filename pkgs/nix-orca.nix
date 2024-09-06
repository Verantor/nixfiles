{ lib
, stdenv
, fetchFromGitHub
, buildGoModule
,
}:
let
  version = "0.0.8";
in
buildGoModule {
  pname = "nix-orca";
  inherit version;

  src = fetchFromGitHub {
    owner = "Verantor";
    repo = "nix-orca";
    rev = "v${version}";
    hash = "sha256-+5Kf9YeEaOn+HUbsKEdbgJTR7S18FSvYQbHoHcx83TE=";
    # hash = lib.fakeHash;
  };

  vendorHash = "sha256-ImkjeeMnP58F0b/0p1AvPdG7zsl69iX9IEFLXvQgPEg=";
  # vendorHash = lib.fakeHash;
  meta = with lib; {
    homepage = "https://github.com/Verantor/nix-orca";
    description = "nix helper scripts";
    license = licenses.gpl3;
    maintainers = with maintainers; [ Verantor ];
  };
}
