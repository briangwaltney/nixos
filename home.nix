{
  lib,
  config,
  pkgs,
  ...
}: {
  home = {
    username = "brian";
    homeDirectory = "/home/brian/";

    stateVersion = "24.11";

    packages = with pkgs; [];

    file = {};

    shell = pkgs.zsh;

    sessionVariables = {
      EDITOR = "neovim";
    };
  };

  programs.home-manager.enable = true;
}
