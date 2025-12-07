{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    mouse = true;
    escapeTime = 0;
    keyMode = "vi";
    terminal = "screen-256color";
    extraConfig = ''
      bind C-p previous-window
      bind C-n next-window

      bind -n M-1 select-window -t 1
      bind -n M-2 select-window -t 2
      bind -n M-3 select-window -t 3
      bind -n M-4 select-window -t 4
      bind -n M-5 select-window -t 5
      bind -n M-6 select-window -t 6
      bind -n M-7 select-window -t 7
      bind -n M-8 select-window -t 8
      bind -n M-9 select-window -t 9

      bind -n M-Left select-pane -L
      bind -n M-Right select-pane -R
      bind -n M-Up select-pane -U
      bind -n M-Down select-pane -D

      bind -n M-C-Left resize-pane -L 5
      bind -n M-C-Right resize-pane -R 5
      bind -n M-C-Up resize-pane -U 3
      bind -n M-C-Down resize-pane -D 3

      bind -n M-S-Up swap-pane -U     
      bind -n M-S-Down swap-pane -D   

      bind -n M-= split-window -h -c "#{pane_current_path}"
      bind -n M-- split-window -v -c "#{pane_current_path}"

      bind -n M-Enter new-window
      bind -n M-q kill-pane
      bind -n M-c kill-window
      bind -n M-C kill-session

      bind -n M-r command-prompt "rename-window '%%'"
      bind -n M-l choose-window
      bind -n M-L choose-tree -Zw

      bind -n M-S {
        display-message "Saving session..."
        run-shell '#{plugin_root_dir}/resurrect/scripts/save.sh'
        display-message "Saved to: #{plugin_root_dir}/resurrect/"
      }
      bind -n M-R run-shell '#{plugin_root_dir}/resurrect/scripts/restore.sh'
    '';
    plugins = with pkgs; [
      tmuxPlugins.rose-pine
      {
        plugin = tmuxPlugins.resurrect;
        extraConfig = ''
          set -g @resurrect-strategy-nvim 'session'
          set -g @resurrect-strategy-vim 'session'
          set -g @resurrect-capture-pane-contents 'on'
          set -g @resurrect-dir '~/.config/tmux/resurrect'
        '';
      }
      {
        plugin = tmuxPlugins.continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '10'
          set -g @continuum-save-on-exit 'on'
          set -g @continuum-boot 'on'
        '';
      }
    ];
  };
}
