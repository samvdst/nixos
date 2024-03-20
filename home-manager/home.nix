# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  outputs,
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

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  # Add stuff for your user as you see fit:
  home.packages = [
   pkgs._1password-gui
   pkgs.bat
   pkgs.bemenu # wayland clone of dmenu
   pkgs.curl
   pkgs.delta
   pkgs.docker
   pkgs.docker-compose
   pkgs.dracula-theme
   pkgs.eza
   pkgs.fd
   pkgs.file
   pkgs.fnm
   pkgs.gcc
   pkgs.gh
   pkgs.go
   pkgs.graphite-cli
   pkgs.grim # screenshot
   pkgs.lazygit
   pkgs.nerdfonts
   pkgs.nodejs
   pkgs.oh-my-zsh
   pkgs.pavucontrol
   pkgs.pulseaudio
   pkgs.remmina
   pkgs.ripgrep
   pkgs.signal-desktop
   pkgs.slurp # screenshot
   pkgs.tmate
   pkgs.tmux
   pkgs.unzip
   pkgs.vim
   pkgs.wget
   pkgs.xterm
   pkgs.zig
   pkgs.zsh-autosuggestions
   pkgs.zsh-syntax-highlighting
   pkgs.zsh-vi-mode
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
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        size = 12;
        normal = {
          family = "UbuntuMono Nerd Font Mono";
          style = "Regular";
        };
        italic = {
          family = "UbuntuMono Nerd Font Mono";
          style = "Italic";
        };
        bold = {
          family = "UbuntuMono Nerd Font Mono";
          style = "Bold";
        };
      };
      window = {
        opacity = 0.9;
      };
    };
  };
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
}
