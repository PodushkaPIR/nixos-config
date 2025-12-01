{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    mouse = true;
    escapeTime = 0;
    keyMode = "vi";
    termainal = "screen-256color";
    extraConfig = ''
    
    '';
  };
}
