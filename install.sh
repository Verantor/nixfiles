curl https://raw.githubusercontent.com/Verantor/nixfiles/refs/heads/main/hosts/main/disko.nix -o /tmp/disko-config.nix
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko /tmp/disko-config.nix
sudo nixos-generate-config --no-filesystems --root /mnt
cd /mnt/etc/nixos/
git clone git@github.com:Verantor/nixfiles.git
cd nixfiles/
sudo nixos-install --root /mnt --flake '/mnt/etc/nixos/nixfiles#main'


