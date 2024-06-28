{ pkgs ? import <nixpkgs> { } }:
let
  lib = pkgs.lib;
  fetchFromGitHub = pkgs.fetchFromGitHub;
in
pkgs.rustPlatform.buildRustPackage rec {
  pname = "maccel";
  version = "0.1.2";

  src = fetchFromGitHub {
    owner = "Gnarus-G";
    repo = "maccel";
    rev = "v${version}";
    sha256 = "sha256-Unrv2GKvndGZauYyNvjDvqHI+r6zO51aZTG0xmMhrng=";
  };
  sourceRoot = "source/cli";

  cargoLock = {
    lockFile = src + "/cli/Cargo.lock";
  };
  # cargoHash = lib.fakeHash;
  checkFlags = [
    # reason for disabling test
    "--skip=params::tests::getters_setters_work"
  ];
  meta = with lib; {
    description = "A mouse acceleration driver for Linux";
    homepage = "https://github.com/Gnarus-G/maccel";
    license = licenses.gpl2;
    maintainers = [ maintainers.Verantor ];
    platforms = platforms.linux;
  };
}
