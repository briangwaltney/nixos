{
  programs.zsh = {
    enable = true;
    shellAliases = let
      flakePath = "~/.config/nixos";
    in {
      hms = "home-manager switch --flake ${flakePath}";
      v = "neovim";
    };
  };
}
