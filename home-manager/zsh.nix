{config, ...}:
{
  programs.zsh = {
      enable = true;
      enableCompletion = true;
      enableAutosuggestions = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        ll = "ls -l";
        lla = "ls -la";
        gs = "git status";
        gl = "git log";
        lg = "lazygit";
        hb = "gh browse";
        vim = "nvim";
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
      oh-my-zsh = {
        enable = true;
        plugins = [ "git" ];
        theme = "gozilla";
      };
  };
}
