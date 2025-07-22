{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
    wget
    discord
    youtube-music
    git
    gh
    brave

    # Notifications
    mako
    libnotify

    waybar

    swww #background images
    rofi-wayland #login manager

    ghostty

    home-manager

    unzip
    cargo
    go
    opam
    nodejs
    ripgrep
    wl-clipboard
    zig
    gcc
    fzf
  ];

  networking.hostName = "nixos";

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # networking.hostName = "nixos"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;
  networking.firewall.enable = false;

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Configure keymap in X11
  services.xserver = {
    xkb = {
      layout = "us";
      variant = "";
    };
    videoDrivers = ["amdgpu"];
  };

  security.sudo.extraRules = [
    {
      users = ["brian"];
      commands = [
        {
          command = "ALL";
          options = ["NOPASSWD"];
        }
      ];
    }
  ];

  programs.hyprland.enable = true;
  # programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;

  programs.zsh.enable = true;

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  hardware = {
    graphics.enable = true;
    nvidia.modesetting.enable = true;
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];

  security.rtkit.enable = true;

  hardware.bluetooth.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.brian = {
    isNormalUser = true;
    description = "Brian Gwaltney";
    extraGroups = ["networkmanager" "wheel"];
    shell = pkgs.zsh;
    packages = with pkgs; [];
  };

  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
    };
    nvf = {
      enable = true;

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
          lualine.theme = "catppuccin";
        };
        theme = {
          enable = true;
          name = "catppuccin";
          style = "mocha";
        };
        autopairs.nvim-autopairs.enable = true;
        autocomplete = {
          blink-cmp.enable = true;
        };
        filetree = {
          neo-tree = {
            enable = true;
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
  };

  services.openssh.enable = true;

  # system.autoUpgrade = {
  #   enable = true;
  #   flake = inputs.self.outpath;
  #   flags = [
  #     "--update-input"
  #     "nixpkgs"
  #     "-L"
  #   ];
  #   dates = "09:00";
  # };

  system.stateVersion = "25.05"; # Did you read the comment?
}
