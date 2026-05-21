{pkgs, ...}:
{
  programs.zsh = {
    enable = true;

    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;

    ohMyZsh = {
      enable = false;
      theme = "robbyrussell"; # simple y rápido
      plugins = [ "git" ];
    };

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];
  };
}