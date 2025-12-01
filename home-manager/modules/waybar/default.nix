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
        modules-right = ["hyprland/language" "clock"];
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
