# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    ./nvim.nix
    ./zsh.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "sam";
    homeDirectory = "/home/sam";
  };

  # Add stuff for your user as you see fit:
  home.packages = with pkgs; [
    _1password-gui
    bat
    bemenu # wayland clone of dmenu
    cargo
    curl
    delta
    dracula-theme
    eza
    fd
    fnm
    gcc
    gh
    go
    grim # screenshot
    lazygit
    nerdfonts
    nodejs
    oh-my-zsh
    pavucontrol
    pulseaudio
    remmina
    ripgrep
    signal-desktop
    slurp # screenshot
    tmate
    tmux
    unzip
    vim
    wget
    xfce.thunar
    xterm
    zig
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-vi-mode
  ];

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userName = "Samuel Van der Stappen";
    userEmail = "sam@vd.st";
    extraConfig = {
      credential."https://github.com".helper = "!gh auth git-credential";
      credential."https://gist.github.com".helper = "!gh auth git-credential";
      core = {
        pager = "delta";
        editor = "nvim";
      };
      interactive.diffFilter = "delta --color-only";
      delta.navigate = "true";
      merge.conflictstyle = "diff3";
      diff.colorMoved = "default";
      init.defaultBranch = "main";
      push.autoSetupRemote = "true";
    };
  };
  programs.alacritty.enable = true;
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
}
