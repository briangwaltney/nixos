{
  config,
  pkgs,
  ...
}: {
  home.username = "brian";
  home.homeDirectory = "/home/brian";

  home.stateVersion = "24.11";

  home.packages = [
    # pkgs.nerdfonts
  ];

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "neovim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
