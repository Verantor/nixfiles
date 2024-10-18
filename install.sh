sudo nix  --experimental-features "nix-command flakes" run 'github:nix-community/disko#disko-install/latest' -- --flake github.com:Verantor/nixfiles#main --disk main /dev/nvme0n1
