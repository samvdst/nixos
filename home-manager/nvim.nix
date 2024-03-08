{ config, pkgs, ... }:

{
  home.file."${config.xdg.configHome}/nvim" = {
    source = ./nvim;
    recursive = true;
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [
    ];
  };
}
