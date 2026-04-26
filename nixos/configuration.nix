{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./modules/nvidia.nix
    ./modules/hyprland.nix
    ./modules/audio.nix
    ./modules/fonts.nix
    ./modules/zapret.nix
  ];

  system.stateVersion = "26.05";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 3;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  nix = {
    package = pkgs.nix;
    settings = {
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
    };

    gc = {
      automatic = true;
      options = "--delete-older-than 1d";
    };
  };

  time.timeZone = "Asia/Yekaterinburg";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ALL = "en_US.UTF-8";
  };

  nixpkgs.config.allowUnfree = true;

  users.users.nixos = {
    isNormalUser = true;
    description = "nixos";
    extraGroups = ["networkmanager" "wheel" "video" "audio" "storage"];
    shell = pkgs.fish;
  };

  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "nixos";
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  security.sudo.extraRules = [{
    users = [ "nixos" ];
    commands = [{
      command = "/run/current-system/sw/bin/bash /home/nixos/zapret-discord-youtube-linux/main_script.sh";
      options = [ "NOPASSWD" ];
    }];
  }];

  services.flatpak.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  environment.variables = {
    XCURSOR_THEME = "phinger-cursors-dark";
    XCURSOR_SIZE = "24";
  };

  environment.systemPackages = with pkgs; [
    git
    wget
    curl
    unzip
    zip
    phinger-cursors
    throne
    xfce.thunar
    prismlauncher    
    gamemode
    spotify
    gamescope
    playerctl
    discord 
    prismlauncher
    vscode
    kdePackages.ark
    hyprshot
    unrar
    cmake
    pkg-config
    gcc
    python3
    rustc
    cargo
    curl 
    sqlite
    libpng
    freetype
    libogg
    opusfile
    SDL2
    vulkan-headers
    vulkan-loader
    shaderc
    glslang
    kdePackages.kate
    mpvpaper
    mpv
    foot
    obs-studio
    doas
  ];

programs.throne = {
  enable = true;
  tunMode.enable = true;
};

  programs.fish.enable = true;

  security.sudo.enable = true;
}
