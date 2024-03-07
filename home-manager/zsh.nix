{ config, ... }:

{
  programs.zsh = {
      enable = true;
      enableCompletion = true;
      enableAutosuggestions = true;

      shellAliases = {
        ll = "ls -l";
        lla = "ls -la";
        gs = "git status";
        gl = "git log";
        lg = "lazygit";
        hb = "gh browse";
        v = "nvim";
        c = "nvim";
        cat = "bat";
        t = "tmux";
        tl = "tmux ls";
        ta = "tmux a -t";
        tn = "tmux new -s";
        rgf = "rg --files | rg";
        rgfu = "rg -u --files | rg";
        rgfuu = "rg -uu --files | rg";
        rgfuuu = "rg -uuu --files | rg";
        rgu = "rg -u";
        rguu = "rg -uu";
        rguuu = "rg -uuu";
        config = "git --git-dir=$HOME/.cfg/ --work-tree=$HOME"; # TODO: is there a way to use nix variables for home
      };

      history.size = 25000;
      history.path = "${config.xdg.dataHome}/zsh/history";
      dotDir = ".config/";

      plugins = [
        {
            name = "zsh-vi-mode";
            file = "zsh-vi-mode.plugin.zsh";
            src = builtins.fetchGit {
              url = "https://github.com/jeffreytse/zsh-vi-mode";
              rev = "ea1f58ab9b1f3eac50e2cde3e3bc612049ef683b";
            };
        }
        {
            name = "zsh-syntax-highlighting";
            file = "zsh-syntax-highlighting.plugin.zsh";
            src = builtins.fetchGit {
              url = "https://github.com/zsh-users/zsh-syntax-highlighting";
              rev = "db085e4661f6aafd24e5acb5b2e17e4dd5dddf3e";
            };
        }
      ];

      oh-my-zsh = {
        enable = true;
        plugins = [ "git" ];
        theme = "gozilla";
      };
  };
}
