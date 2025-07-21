{
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
      v = "neovim";
    };

    shellInit = ''
      set -o emacs
      export EDITOR="nvim"
      export VISUAL="nvim"
      eval "$(starship init zsh)"
      eval "$(zoxide init zsh)"
    '';
  };

  programs.starship = {
    enable = true;
    settings = {
      format = "$all$nix_shell$nodejs$lua$golang$rust$php$git_branch$git_commit$git_state$git_status\n$username$hostname$directory";
      directory = {
        format = "[$path ](#8FBCBB)";
        truncation_length = 12;
        truncation_symbol = "../";
        substitutions = {
          Documents = "󰈙 ";
          Downloads = " ";
          Music = "󰝚 ";
          Pictures = " ";
          Developer = "󰲋 ";
        };
      };
      git_status.format = "[[($all_status$ahead_behind)](fg:#d9f99d)](#d9f99d)";
      git_branch.format = "[[$branch ](fg:#d9f99d)](#d9f99d)";
      line_break.disabled = true;
      character = {
        disabled = false;
        success_symbol = "[](bold fg:#fdba74)";
        error_symbol = "[](bold fg:#fca5a5)";
        vimcmd_symbol = "[](bold fg:#8FBCBB)";
        vimcmd_replace_one_symbol = "[](bold fg:#38bdf8)";
        vimcmd_replace_symbol = "[](bold fg:#38bdf8)";
        vimcmd_visual_symbol = "[](bold fg:#fdba74)";
      };
    };
  };
  programs.zoxide.enable = true;
}
