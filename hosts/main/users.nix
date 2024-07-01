{ pkgs, ... }:
{
  users.users.ver = {
    shell = pkgs.fish;
    useDefaultShell = true;
  };
  programs.fish.enable = true;
}
