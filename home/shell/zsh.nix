{pkgs, ...}:
{
  home.file.".p10k.zsh".source = true;

  programs.zsh = {
    history = {
      size = 5000;
      save = 5000;
      ignoreDups = true;
      share = true;
    };

    setopt = [ "AUTO_CD" "CORRECT" ];

    plugins = [
        {
          name = "powerlevel10k";
          src = pkgs.zsh-powerlevel10k;
          file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        }
      ];

      initExtraFirst = ''
        if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
          source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
        fi
      '';

      initExtra = ''
        # Esto cargará el archivo .p10k.zsh que Home Manager acaba de crear
        [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
      '';
  };
}