{
  lib,
  config,
  pkgs,
  ...
}: {
  programs.nvf = {
    enable = true;
    defaultEditor = true;

    settings.vim = {
      options = {
        scrolloff = 16;
        foldmethod = "marker";
        foldlevel = 99;
        timeoutlen = 400;
        smartcase = true;
      };
      lsp = {
        enable = true;
        formatOnSave = true;
        inlayHints.enable = true;
      };
      languages = {
        enableTreesitter = true;
        enableFormat = true;
        enableExtraDiagnostics = true;

        nix.enable = true;
        markdown.enable = true;
        bash.enable = true;
        css.enable = true;
        html.enable = true;
        sql.enable = true;
        ts.enable = true;
        go.enable = true;
        lua.enable = true;
        ocaml.enable = true;
        tailwind.enable = true;
      };
      visuals = {
        nvim-web-devicons.enable = true;
      };
      statusline = {
        lualine.enable = true;
        lualine.theme = "nord";
      };
      theme = {
        enable = true;
        name = "base16";
        # name = "nord";
        # style = "mocha";
        base16-colors = {
          base00 = "#252a34";
          base01 = "#3B4252";
          base02 = "#2b364e";
          base03 = "#4C566A";
          base04 = "#D8DEE9";
          base05 = "#E5E9F0";
          base06 = "#ECEFF4";
          base07 = "#8FBCBB";
          base08 = "#88C0D0";
          base09 = "#fca5a5";
          base0A = "#88C0D0";
          base0B = "#d9f99d";
          base0C = "#81A1C1";
          base0D = "#38bdf8";
          base0E = "#fdba74";
          base0F = "#fca5a5";
        };
      };
      autopairs.nvim-autopairs.enable = true;
      autocomplete = {
        blink-cmp.enable = true;
      };
      filetree = {
        neo-tree = {
          enable = true;
          setupOpts = {
            filesystem = {
              filtered_items = {
                visible = true;
                hide_dotfiles = false;
                hide_gitignored = false;
              };
            };
          };
        };
      };
      tabline = {
        nvimBufferline = {
          enable = true;
          mappings = {
            closeCurrent = "<leader>x";
            cyclePrevious = "H";
            cycleNext = "L";
          };
        };
      };
      binds = {
        hardtime-nvim.enable = false;
      };
      telescope.enable = true;
      git = {
        enable = true;
        gitsigns.enable = true;
        neogit.enable = true;
      };
      notify = {
        nvim-notify.enable = true;
      };
      keymaps = [
        {
          key = "U";
          mode = ["n"];
          action = "<C-r>";
          silent = true;
          desc = "undo";
        }
        {
          key = "N";
          mode = ["n"];
          action = "Nzzzv";
          silent = true;
          desc = "prev and center";
        }
        {
          key = "n";
          mode = ["n"];
          action = "nzzzv";
          silent = true;
          desc = "next and center";
        }
        {
          key = "}";
          mode = ["n"];
          action = "<C-d>zz";
          silent = true;
          desc = "half page down";
        }
        {
          key = "{";
          mode = ["n"];
          action = "<C-u>zz";
          silent = true;
          desc = "half page up";
        }
        {
          key = "<ESC>";
          mode = ["n"];
          action = ":noh<CR>";
          silent = true;
          desc = "clear highlights";
        }
        {
          key = "<c-n>";
          mode = ["n"];
          action = ":Neotree close<CR>";
          silent = true;
          desc = "close tree";
        }
        {
          key = "<leader>e";
          mode = ["n"];
          action = ":Neotree reveal<CR>";
          silent = true;
          desc = "open tree";
        }
        {
          key = "<leader>s";
          mode = ["n"];
          action = ":w!<CR>";
          silent = true;
          desc = "save and format";
        }
        {
          key = "ma";
          mode = ["n"];
          action = "zMzz";
          silent = true;
          desc = "close all folds and center";
        }
        {
          key = "mr";
          mode = ["n"];
          action = "zR";
          silent = true;
          desc = "open all folds";
        }
        {
          key = "<leader>f";
          mode = ["n"];
          action = "<cmd> Telescope find_files follow=true <CR>";
          silent = true;
          desc = "run macro q";
        }
        {
          key = "<leader>F";
          mode = ["n"];
          action = "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>";
          silent = true;
          desc = "run macro q";
        }
        {
          key = "<leader>fw";
          mode = ["n"];
          action = "<cmd>:Telescope live_grep <CR>";
          silent = true;
          desc = "run macro q";
        }
        {
          key = "Q";
          mode = ["n"];
          action = "@q";
          silent = true;
          desc = "run macro q";
        }
        {
          key = "mi";
          mode = ["n"];
          action = "za";
          silent = true;
          desc = "toggle current fold";
        }
        {
          key = "F";
          mode = ["n"];
          action = "vim.diagnostic.open_float";
          lua = true;
          silent = true;
          desc = "show diagnostics float";
        }
      ];
    };
  };
}
