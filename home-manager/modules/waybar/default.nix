{
  programs.waybar = {
    enable = true;
    # style = ./style.css;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 20;
        modules-left = ["hyprland/workspaces"];
        modules-center = [];
        modules-right = ["hyprland/language" "battery" "battery#bat2" "clock"];

        "hyprland/workspaces" = {
          disable-scroll = false;
          all-outputs = true;
          format = "{icon}";
          format-icons = {
            active = "●";
            default = "○";
          };
          on-click = "activate";
        };

        "hyprland/language" = {
          format = "{}";
          format-en = "EN";
          format-ru = "RU";
        };

        "battery" = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          format-charging = "{capacity}% 󰂄";
          format-plugged = "{capacity}% 󱘖";
          format-full = "{capacity}% 󱟢";
          format-icons = ["󱊡" "󱊢" "󱊣" "󱊤" "󱊥"];
          bat = "BAT0";
        };

        "battery#bat2" = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          format-charging = "{capacity}% 󰂄";
          format-plugged = "{capacity}% 󱘖";
          format-full = "{capacity}% 󱟢";
          format-icons = ["󱊡" "󱊢" "󱊣" "󱊤" "󱊥"];
          bat = "BAT1";
        };

        "clock" = {
          format = "{:%d.%m.%Y - %H:%M:%S}";
          format-alt = "{:%A, %B %d at %R}";
          interval = 1;
          tooltip-format = "<tt>{calendar}</tt>";
        };
      };
    };
  };
}
