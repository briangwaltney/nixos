{
  programs.zoxide.enable = true;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;

    shellAliases = let
      flakePath = "~/.config/nixos";
    in {
      air = "~/go/bin/air -c .air.toml";
      rebuild = "~/.config/rebuild.sh";
      hms = "home-manager switch --flake ${flakePath}";
      v = "nvim";
    };

    shellInit = ''
      set -o emacs
      export EDITOR="nvim"
      export VISUAL="nvim"
      eval "$(starship init zsh)"
      eval "$(zoxide init zsh)"
    '';
  };
}
