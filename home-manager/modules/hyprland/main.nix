{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    settings = {
      env = [
        # Hint Electron apps to use Wayland
        "NIXOS_OZONE_WL,1"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "QT_QPA_PLATFORM,wayland"
        "XDG_SCREENSHOTS_DIR,$HOME/screens"

        "XMODIFIERS,@im=fcitx"
        "GTK_IM_MODULE,fcitx"
        "QT_IM_MODULE,fcitx"
        "SDL_IM_MODULE,fcitx"
        "GLFW_IM_MODULE,ibus"
      ];

      monitor = [
        "eDP-1,1920x1080@60,auto,1"
        "HDMI-A-2,1920x1080@60,auto,1"
      ];

      "$mainMod" = "SUPER";
      "$terminal" = "kitty";
      "$fileManager" = "$terminal sh -c yazi";
      "$menu" = "wofi";

      exec-once = [
        "waybar"
        # "fcitx5 -d"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
      ];

      general = {
        gaps_in = 0;
        gaps_out = 0;

        border_size = 2;

        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";

        resize_on_border = true;

        allow_tearing = false;
        layout = "master";
      };

      decoration = {
        rounding = 0;

        active_opacity = 1.0;
        inactive_opacity = 1.0;

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          "color" = "rgba(1a1a1aee)";
        };

        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          
          vibrancy = 0.1696;
        };
      };

      animations = {
        enabled = true;
      };

      input = {
        kb_layout = "us,ru";
        kb_options = "grp:ctrl_space_toggle";
        
        touchpad = {
          natural_scroll = true;
        };
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_invert = true;
        workspace_swipe_forever	= true;
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "slave";
        new_on_top = true;
        mfact = 0.5;
      };

      misc = {
        force_default_wallpaper = -1;
        disable_hyprland_logo = false;
      };
      
      workspace = [
        "1, name:Dev, monitor:eDP-1, persistent:true"
        "2, name:Browser, monitor:HDMI-A-2, persistent:true"
        "3, name:Obsidian, monitor:eDP-1, persistent:true"
        "4, name:Zathura, monitor:HDMI-A-2, persistent:true"
        "5, name:Test, monitor:eDP-1, persistent:true"
        "6, name:Sandbox, monitor:HDMI-A-2, persistent:true"
        "7, name:Telegram, monitor:eDP-1, persistent:true"
        "8, name:Videos, monitor:HDMI-A-2, persistent:true"
      ];

      windowrulev2 = [
        "float, pin, size 800 450, move 100 100, class:^(firefox)$, title:^(Picture-in-Picture|Picture in Picture)$"

        "workspace 2, class:^(firefox|chromium|google-chrome|brave-browser)$"
        "workspace 3, class:^(obsidian)$"
        "workspace 4, class:^(zathura)$"
        "workspace 6, class:^(virt-manager|virt-viewer)$"
        "workspace 7, class:^(org.telegram.desktop)$"
        "workspace 8, class:^(org.telegram.desktop)$, title:^Media viewer$"
        "workspace 8, class:^(mpv|vlc)$"

      ];
    };
  };
}
