{ pkgs, ... }:
let
  booksDir = "$HOME/Downloads/books";
  booksScript = pkgs.writeScriptBin "open_books" ''
    #!/bin/sh

    BOOKS_DIR="${booksDir}"

    BOOK=$(find "$BOOKS_DIR" -type f \( -iname "*.pdf" -o -iname "*.epub" -o -iname "*.djvu" \) | wofi --dmenu --prompt "Select a book" --width 1200 --height 400)

    if [[ -n "$BOOK" ]]; then
        zathura "$BOOK" &
    else
        echo "No book selected."
    fi
  '';

  wallpaperRandom = pkgs.writeScriptBin "random_wallpaper" ''
    #!/bin/sh
    WALLPAPER_DIR="$HOME/Pictures/wallpapers"

    mkdir -p "$WALLPAPER_DIR"

    WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) | shuf -n 1)

    if [[ -n "$WALLPAPER" ]]; then
        hyprctl hyprpaper preload "$WALLPAPER"
        hyprctl hyprpaper wallpaper "eDP-1,$WALLPAPER"
        hyprctl hyprpaper wallpaper "HDMI-A-1,$WALLPAPER"
        hyprctl hyprpaper wallpaper "HDMI-A-2,$WALLPAPER"

        echo "Wallpaper set to: $WALLPAPER"
    else
        echo "No wallpapers found in $WALLPAPER_DIR"
        echo "Please add some images to ~/Pictures/wallpapers/"
    fi
  '';

  wallpaperChooser = pkgs.writeScriptBin "choose_wallpaper" ''
    #!/bin/sh
    WALLPAPER_DIR="$HOME/Pictures/wallpapers"
    mkdir -p "$WALLPAPER_DIR"

    SELECTED=$(nsxiv -t -o "$WALLPAPER_DIR")

    if [ -n "$SELECTED" ]; then
        WALLPAPER=$(echo "$SELECTED" | head -n1)
        hyprctl hyprpaper preload "$WALLPAPER"
        hyprctl hyprpaper wallpaper "eDP-1,$WALLPAPER"
        hyprctl hyprpaper wallpaper "HDMI-A-1,$WALLPAPER"
        hyprctl hyprpaper wallpaper "HDMI-A-2,$WALLPAPER"
        echo "Wallpaper set to: $WALLPAPER"
    else
        echo "No wallpaper selected."
    fi
  '';
  
  syncWorkspacePair = pkgs.writeScriptBin "sync_workspace_pair" ''
    #!/bin/bash
    ACTIVE_WS=$(hyprctl activeworkspace | head -1 | grep -o '[0-9]*' | head -1)

    if (( $ACTIVE_WS % 2 == 1 )); then
        hyprctl dispatch workspace $((ACTIVE_WS + 1))
        hyprctl dispatch workspace $ACTIVE_WS
    else
        hyprctl dispatch workspace $((ACTIVE_WS - 1))
        hyprctl dispatch workspace $ACTIVE_WS
    fi
  '';

in {
  home.packages = [
        booksScript
        wallpaperRandom
        wallpaperChooser
        syncWorkspacePair
    ];

  wayland.windowManager.hyprland.settings = {
    bind = [
      # ========== LAUNCH ==========
      "$mainMod,       Return, exec, $terminal"
      "$mainMod,       Q, killactive,"
      "$mainMod SHIFT, C, exit,"
      "$mainMod,       E, exec, $fileManager"
      "$mainMod,       D, exec, $menu --show drun"

      # ========== WINDOWS ==========
      "$mainMod,       M, togglefloating,"
      "$mainMod,       G, togglegroup,"
      "$mainMod,       J, togglesplit,"
      "$mainMod,       P, pin,"
      "$mainMod,       F, fullscreen"

      # ========== TOOLS ==========
      # "$mainMod SHIFT  P, exec, hyprpicker -an"
      "$mainMod,       W, exec, ${booksScript}/bin/open_books"
      "$mainMod,       B, exec, pkill -SIGUSR2 waybar"
      "$mainMod SHIFT, B, exec, pkill -SIGUSR1 waybar"
      "$mainMod,       L, exec, loginctl lock-session"
      "$mainMod,       N, exec, swaync-client -t"
      "$mainMod,       V, exec, cliphist list | $menu --dmenu | cliphist decode | wl-copy"
      ", Print, exec, grimblast --notify --freeze copy area"

      # ========== WALLPAPERS ==========
      "$mainMod SHIFT, R, exec, ${wallpaperRandom}/bin/random_wallpaper"
      "$mainMod CTRL,  R, exec, ${wallpaperChooser}/bin/choose_wallpaper"

      # ========== FOCUS ==========
      "$mainMod, left, movefocus, l"
      "$mainMod, right, movefocus, r"
      "$mainMod, up, movefocus, u"
      "$mainMod, down, movefocus, d"

      # ========== MOVE WINDOWS ==========
      "$mainMod SHIFT, left,  swapwindow, l"
      "$mainMod SHIFT, right, swapwindow, r"
      "$mainMod SHIFT, up,    swapwindow, u"
      "$mainMod SHIFT, down,  swapwindow, d"

      # ========== RESIZE ==========
      "$mainMod CTRL, left,  resizeactive, -60 0"
      "$mainMod CTRL, right, resizeactive,  60 0"
      "$mainMod CTRL, up,    resizeactive,  0 -60"
      "$mainMod CTRL, down,  resizeactive,  0  60"

      # ========== WORKSPACE ==========
      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"
      "$mainMod, 0, workspace, 10"

      "$mainMod, Tab, workspace, previous, sameworkspace"
      "$mainMod, Space, exec, ${syncWorkspacePair}/bin/sync_workspace_pair"

      # Moving windows to workspaces
      "$mainMod SHIFT, 1, movetoworkspacesilent, 1"
      "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
      "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
      "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
      "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
      "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
      "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
      "$mainMod SHIFT, 8, movetoworkspacesilent, 8"
      "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
      "$mainMod SHIFT, 0, movetoworkspacesilent, 10"

      # Scratchpad
      "$mainMod,       S, togglespecialworkspace,  magic"
      "$mainMod SHIFT, S, movetoworkspace, special:magic"
    ];

    # ========== MOUSE ==========
    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];

    # ========== MULTIMEDIA ==========
    bindel = [
      ",XF86AudioRaiseVolume,  exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume,  exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ",XF86AudioMute,         exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ",XF86AudioMicMute,      exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      "$mainMod, bracketright, exec, brightnessctl s 10%+"
      "$mainMod, bracketleft,  exec, brightnessctl s 10%-"
    ];

    bindl = [
      ", XF86AudioNext,  exec, playerctl next"
      ", XF86AudioPause, exec, playerctl play-pause"
      ", XF86AudioPlay,  exec, playerctl play-pause"
      ", XF86AudioPrev,  exec, playerctl previous"
    ];
  };
}
