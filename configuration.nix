{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./shell.nix
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

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.brian = {
    isNormalUser = true;
    description = "Brian Gwaltney";
    extraGroups = ["networkmanager" "wheel"];
    shell = pkgs.zsh;
    packages = with pkgs; [];
  };

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
