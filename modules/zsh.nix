{pkgs}:
{
  programs.zsh = {
    enable = true;

    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    ohMyZsh = {
      enable = true;
      theme = "robbyrussell"; # simple y rápido
      plugins = [ "git" ];
    };

    promptInit = '' 
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
    '';
  };
}