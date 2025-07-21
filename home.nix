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

    packages = with pkgs; [
      hello
      cowsay
    ];

    file = {
      "hello.txt".text = "Hello, world!";
    };

    sessionVariables = {
      EDITOR = "neovim";
    };
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

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
