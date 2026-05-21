{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "eza -la";
      rebuild = "nh os switch";
      update = "nh os switch --update";
    };

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    interactiveShellInit = ''
      # fzf-tab config
      zstyle ':completion:*' menu no
      zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --tree --color=always $realpath'
      zstyle ':fzf-tab:*' switch-group ',' '.'
    '';

    plugins = [
      {
        name = "fzf-tab";
        src = pkgs.zsh-fzf-tab;
      }
    ];
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.atuin = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      auto_sync = true;
      sync_frequency = "5m";
      search_mode = "fuzzy";
      style = "compact";
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.starship = {
    enable = true;

    settings = {
      add_newline = false;

      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[➜](bold red)";
      };

      nix_shell = {
        format = "via [$symbol$state( \\($name\\))]($style) ";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    eza
    fd
    ripgrep
    bat
    carapace
  ];
}