{ config, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = false;
    syntaxHighlighting.enable = true;

    # shellAliases = { };

    oh-my-zsh = {
      enable = true;
      plugins = [];
      theme = "alanpeabody";
    };

    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";

    initContent = ''
      # Start Tmux automatically if not already running. No Tmux in TTY
      # if [ -z "$TMUX" ] && [ -n "$DISPLAY" ]; then
      #   tmux attach-session -t default || tmux new-session -s default
      # fi

      # Start UWSM
      if uwsm check may-start > /dev/null && uwsm select; then
        exec systemd-cat -t uwsm_start uwsm start default
      fi
    '';
  };
}
