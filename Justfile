# just is a command runner, Justfile is very similar to Makefile, but simpler.

# use nushell for shell commands
set shell := ["bash", "-c"]

############################################################################
#
#  Nix commands related to the local machine
#
############################################################################


up:
  sudo nix flake update
  sudo nixos-rebuild switch --upgrade --flake .#main |& nom

# Update specific input
# Usage: just upp nixpkgs

history:
    --profile /nix/var/nix/profiles/system

rb:
  if git diff --quiet '*.nix'; then
  echo "No changes detected, exiting."
  exit 0
  fi
  nixpkgs-fmt .
  git diff -U0 '*.nix'
  echo "NixOS Rebuilding..."
  sudo nixos-rebuild switch --flake .#main |& nom
  current=$(nixos-rebuild list-generations | grep current)
  git commit -am "$current"
  notify-send -e "NixOS Rebuilt OK!" --icon=software-update-available

iso:
  #nix build .#nixosConfigurations.iso.config.system.build.isoImage
  #nixos-generate -f iso --flake ".#main" --system aarch64-linux -I flake.nix

clean:
  # remove all generations older than 7 days
  sudo nix profile wipe-history --profile /nix/var/nix/profiles/system  --older-than 7d

gc:
  # garbage collect all unused nix store entries
  sudo nix store gc --debug
  sudo nix-collect-garbage --delete-old

gitgc:
  git reflog expire --expire-unreachable=now --all
  git gc --prune=now

bd1:
  ssh ver@192.168.178.82


scan:
  nmap 192.168.178.1-254


fmt:
  # format the nix files in this repo
  nixpkgs-fmt .

path:
   $env.PATH | split row ":"

push:
  git commit -am "updated"
  git push origin main
