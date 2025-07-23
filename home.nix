{
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./sh.nix
  ];
  home = {
    username = "brian";
    homeDirectory = "/home/brian/";

    stateVersion = "24.11";

    packages = with pkgs; [];

    file = {
      ".config/hypr/hyprland.conf".source = ./hyprland.conf;
      ".config/nvim".source = ./new-nvim;
    };

    sessionVariables = {
      EDITOR = "neovim";
    };
  };

  programs.home-manager.enable = true;
}
